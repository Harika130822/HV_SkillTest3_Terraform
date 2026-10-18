

## Docker Local Images and Container generation using Dockerfiles

```
docker-compose -up

[+] up 13/13d] exporting to image
 ✔ Image ecomm-frontend:latest        Built                                                                                                                                24.8s
 ✔ Image ecomm-user-service:latest    Built                                                                                                                                24.8s
 ✔ Image ecomm-order-service:latest   Built                                                                                                                                24.8s
 ✔ Image ecomm-cart-service:latest    Built                                                                                                                                24.8s
 ✔ Image ecomm-product-service:latest Built                                                                                                                                24.8s
 ✔ Network ecommerce-network          Created                                                                                                                              0.1s
 ✔ Container mongo                    Created                                                                                                                              3.2s
 ✔ Container ecommorder-service       Created                                                                                                                              0.4s
 ✔ Container ecommproduct-service     Created                                                                                                                              0.4s
 ✔ Container ecommcart-service        Created                                                                                                                              0.4s
 ✔ Container ecommuser-service        Created                                                                                                                              0.3s
 ✔ Container ecommfrontend            Created                                                                                                                              0.1s
 ✔ Container nginx                    Created


PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker images
                                                                                                                                           i Info →   U  In Use
IMAGE                                                                                  ID             DISK USAGE   CONTENT SIZE   EXTRA
docker/desktop-cloud-provider-kind:v0.5.0                                              4ad59ce20658        595MB          162MB    U   
docker/desktop-containerd-registry-mirror:v0.0.3                                       179a9ea3ae47       50.3MB         16.1MB    U   
ecomm-cart-service:latest                                                              bc603dc0e248        269MB         59.3MB    U   
ecomm-frontend:latest                                                                  d06a095ed8cb        1.3GB          238MB    U   
ecomm-order-service:latest                                                             1390cfb7176e        269MB         59.3MB    U   
ecomm-product-service:latest                                                           19696c8d7f0e        262MB         57.8MB    U   
ecomm-user-service:latest                                                              91ef6d4168bd        264MB         58.1MB    U   
envoyproxy/envoy:v1.36.4                                                               08acc53db6f4        248MB         62.1MB        
kindest/node:v1.34.3                                                                   08497ee19eac       1.35GB          395MB    U   
mongo:6                                                                                8b6d8f5bbedb        1.1GB          282MB    U   
nginx:alpine                                                                           892bb2152464        103MB         29.7MB    U   
nginx:latest@sha256:5a88c9c45479443d7be2eadc894b4ed0a9801bae03d97a5760ae13b5c2005942   5a88c9c45479       63.1MB         63.1MB        
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker ps
CONTAINER ID   IMAGE                          COMMAND                  CREATED              STATUS                        PORTS                                             NAMES
4923cf23450c   nginx:alpine                   "/docker-entrypoint.…"   About a minute ago   Up About a minute             0.0.0.0:80->80/tcp, [::]:80->80/tcp               nginx
13fdb8ad483c   ecomm-frontend:latest          "docker-entrypoint.s…"   About a minute ago   Up About a minute             0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp       ecommfrontend
9f1468e56afb   ecomm-cart-service:latest      "docker-entrypoint.s…"   About a minute ago   Up About a minute             0.0.0.0:3003->3003/tcp, [::]:3003->3003/tcp       ecommcart-service
4833f0cf9699   ecomm-product-service:latest   "docker-entrypoint.s…"   About a minute ago   Up About a minute             0.0.0.0:3002->3002/tcp, [::]:3002->3002/tcp       ecommproduct-service
48e0f3ab2d37   ecomm-user-service:latest      "docker-entrypoint.s…"   About a minute ago   Up About a minute             0.0.0.0:3001->3001/tcp, [::]:3001->3001/tcp       ecommuser-service
c2221f47e904   ecomm-order-service:latest     "docker-entrypoint.s…"   About a minute ago   Up About a minute             0.0.0.0:3004->3004/tcp, [::]:3004->3004/tcp       ecommorder-service
2c7ac91f9745   mongo:6                        "docker-entrypoint.s…"   About a minute ago   Up About a minute (healthy)   0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongo
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> 
```
> <img width="1378" height="929" alt="image" src="https://github.com/user-attachments/assets/aa5ac263-775c-490c-bbeb-b7f13244d5af" />

## Docker images push to Docker Hub

```
docker info
docker Login

PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker login
Authenticating with existing credentials... [Username: harika130822]

i Info → To login with a different account, run 'docker logout' followed by 'docker login'


Login Succeeded


PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker tag ecomm-cart-service:latest harika130822/ecomm-cart-service:latest
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker push harika130822/ecomm-cart-service:latest                         
The push refers to repository [docker.io/harika130822/ecomm-cart-service]
e75673d3c80d: Pushed 
1e5a4c89cee5: Mounted from harika130822/ecom-user-service 
f18232174bc9: Mounted from harika130822/ecom-user-service 
dd71dde834b5: Mounted from harika130822/ecom-user-service 
25ff2da83641: Mounted from harika130822/ecom-user-service 
628cb63a894e: Pushed 
9b0144eeeb91: Pushed 
1b5e19213784: Pushed 
b2d83329b214: Pushed 
latest: digest: sha256:bc603dc0e248656b10371ec2fc2dc9e189c22c67b0ff9c42208e358f81912552 size: 856

PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker tag ecomm-order-service:latest harika130822/ecomm-order-service:latest
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker tag ecomm-product-service:latest harika130822/ecomm-product-service:latest
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker tag ecomm-user-service:latest harika130822/ecomm-user-service:latest      
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker tag ecomm-frontend:latest harika130822/ecomm-frontend:latest        
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker push harika130822/ecomm-order-service:latest                              
The push refers to repository [docker.io/harika130822/ecomm-order-service]
518f7bbfc094: Pushed 
1e5a4c89cee5: Mounted from harika130822/ecomm-cart-service 
25ff2da83641: Mounted from harika130822/ecomm-cart-service 
7e3a41c8235a: Pushed 
cb8e69014804: Pushed 
600d89ce6441: Pushed 
f18232174bc9: Mounted from harika130822/ecomm-cart-service 
dd71dde834b5: Mounted from harika130822/ecomm-cart-service 
c80d4cef868c: Pushed 
latest: digest: sha256:1390cfb7176e043684e817ec0b0d4b6e511b7916e085f58453934f78126cb68b size: 856
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker push harika130822/ecomm-product-service:latest                            
The push refers to repository [docker.io/harika130822/ecomm-product-service]
902f2c7bdc47: Pushed 
c9f0e0ced0dd: Pushed 
25ff2da83641: Mounted from harika130822/ecomm-order-service 
f18232174bc9: Mounted from harika130822/ecomm-order-service 
a4b863f43339: Pushed 
bab7c37a4b16: Pushed 
dd71dde834b5: Mounted from harika130822/ecomm-order-service 
1d399b655147: Pushed 
1e5a4c89cee5: Mounted from harika130822/ecomm-order-service 
latest: digest: sha256:19696c8d7f0eef681d74ae3012113c0506a0cfc546d1374bea5bdc0d044c9404 size: 856
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker push harika130822/ecomm-user-service:latest                         
The push refers to repository [docker.io/harika130822/ecomm-user-service]
1e5a4c89cee5: Mounted from harika130822/ecomm-product-service 
f18232174bc9: Mounted from harika130822/ecomm-product-service 
dd71dde834b5: Mounted from harika130822/ecomm-product-service 
868a0dd483f9: Mounted from harika130822/ecom-user-service 
9da39ebf8e68: Pushed 
2a8a14887256: Mounted from harika130822/ecom-user-service 
047c161d784b: Mounted from harika130822/ecom-user-service 
25ff2da83641: Mounted from harika130822/ecomm-product-service 
8c0148cb213f: Mounted from harika130822/ecom-user-service 
latest: digest: sha256:91ef6d4168bd15d23559f0934cd6375f09cad9bb446fd0d6f00ddf7e92df04cb size: 856
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore> docker push harika130822/ecomm-frontend:latest                     
The push refers to repository [docker.io/harika130822/ecomm-frontend]
a767ee94be43: Pushed 
2b7b81dfcf37: Pushed 
f18232174bc9: Mounted from harika130822/ecomm-user-service 
fc106ab1e50a: Pushed 
dd71dde834b5: Mounted from harika130822/ecomm-user-service 
8fbabe05cd83: Pushed 
1e5a4c89cee5: Mounted from harika130822/ecomm-user-service 
2d8d4f158833: Pushed 
25ff2da83641: Mounted from harika130822/ecomm-user-service 
latest: digest: sha256:d06a095ed8cb3a147e38805b29c162a2630736198891c16ec13de36265364820 size: 856
```

> <img width="1582" height="495" alt="image" src="https://github.com/user-attachments/assets/2a8e9316-7978-4e78-9562-08aacbe05079" />
