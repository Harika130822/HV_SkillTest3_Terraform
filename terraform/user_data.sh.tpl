#!/bin/bash
exec > >(tee /var/log/user-data.log) 2>&1
set -x

# 1 GB swap so MongoDB + 4 Node services are safe on small instances
fallocate -l 1G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab

# Install Docker and Nginx
apt-get update -y
apt-get install -y docker.io nginx
systemctl enable --now docker

# Nginx is the only service exposed publicly. Route API requests to the
# corresponding backend container and all other requests to the frontend.
cat > /etc/nginx/sites-available/ecom <<'NGINX'
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;

    client_max_body_size 10m;

    location /api/auth {
        proxy_pass http://127.0.0.1:3001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/users {
        proxy_pass http://127.0.0.1:3001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/products {
        proxy_pass http://127.0.0.1:3002;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/categories {
        proxy_pass http://127.0.0.1:3002;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/cart {
        proxy_pass http://127.0.0.1:3003;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/orders {
        proxy_pass http://127.0.0.1:3004;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/payments {
        proxy_pass http://127.0.0.1:3004;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/ {
        return 404;
    }

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
NGINX

rm -f /etc/nginx/sites-enabled/default
ln -sfn /etc/nginx/sites-available/ecom /etc/nginx/sites-enabled/ecom
nginx -t
systemctl enable --now nginx
systemctl reload nginx

# Shared network: containers reach each other by name
docker network create ecom || true

# Database
docker run -d --name mongo --restart always --network ecom \
  -v mongo-data:/data/db mongo:6.0

# Wait until MongoDB accepts connections before starting the services
until docker exec mongo mongosh --quiet --eval "db.adminCommand('ping')" >/dev/null 2>&1; do sleep 3; done

# Backend services
docker run -d --name user-service --restart always --network ecom \
  -p 127.0.0.1:3001:3001 \
  -e PORT=3001 -e MONGODB_URI=mongodb://mongo:27017/ecommerce_users -e JWT_SECRET='${jwt_secret}' \
  ${dockerhub_username}/ecom-user-service:${image_tag}

docker run -d --name product-service --restart always --network ecom \
  -p 127.0.0.1:3002:3002 \
  -e PORT=3002 -e MONGODB_URI=mongodb://mongo:27017/ecommerce_products \
  ${dockerhub_username}/ecom-product-service:${image_tag}

docker run -d --name cart-service --restart always --network ecom \
  -p 127.0.0.1:3003:3003 \
  -e PORT=3003 -e MONGODB_URI=mongodb://mongo:27017/ecommerce_carts \
  -e PRODUCT_SERVICE_URL=http://product-service:3002 \
  ${dockerhub_username}/ecom-cart-service:${image_tag}

docker run -d --name order-service --restart always --network ecom \
  -p 127.0.0.1:3004:3004 \
  -e PORT=3004 -e MONGODB_URI=mongodb://mongo:27017/ecommerce_orders \
  -e CART_SERVICE_URL=http://cart-service:3003 \
  -e PRODUCT_SERVICE_URL=http://product-service:3002 \
  -e USER_SERVICE_URL=http://user-service:3001 \
  ${dockerhub_username}/ecom-order-service:${image_tag}

# Frontend is reachable only through the host Nginx reverse proxy
docker run -d --name frontend --restart always --network ecom \
  -p 127.0.0.1:3000:3000 \
  ${dockerhub_username}/ecom-frontend:${image_tag}

docker ps