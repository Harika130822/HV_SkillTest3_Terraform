FROM node:18-alpine
WORKDIR /app/backend/cart-service
COPY backend/cart-service/package*.json ./
RUN npm install
COPY backend/cart-service/ .
ENV PORT=3003
EXPOSE 3003
CMD ["npm", "start"]
