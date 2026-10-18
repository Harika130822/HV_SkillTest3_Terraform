FROM node:18-alpine
WORKDIR /app/backend/order-service
COPY backend/order-service/package*.json ./
RUN npm install
COPY backend/order-service/ .
ENV PORT=3004
EXPOSE 3004
CMD ["npm", "start"]
