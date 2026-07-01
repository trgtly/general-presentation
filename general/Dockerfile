# Stage 1: Build the static files
FROM oven/bun:latest AS builder
WORKDIR /app

# Install dependencies
COPY package.json bun.lock ./
RUN bun install

# Copy source code and build
COPY . .
RUN bun run build

# Stage 2: Serve the static files with a lightweight web server
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built assets from builder
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
