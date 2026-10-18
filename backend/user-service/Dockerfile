FROM node:18-alpine
WORKDIR /app/backend/user-service
COPY backend/user-service/package*.json ./
RUN npm install
COPY backend/user-service/ .
ENV PORT=3001
EXPOSE 3001
CMD ["npm", "start"]
