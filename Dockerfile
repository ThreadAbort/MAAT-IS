# Development stage
FROM node:20-alpine as development
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Production build stage
FROM node:20-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM node:20-alpine as production
WORKDIR /app
COPY --from=build /app/build build/
COPY --from=build /app/package*.json ./
RUN npm ci --production
CMD ["node", "build"] 