FROM node:18-alpine
WORKDIR /app/backend/product-service
COPY backend/product-service/package*.json ./
RUN npm install
COPY backend/product-service/ .
ENV PORT=3002
EXPOSE 3002
CMD ["npm", "start"]
