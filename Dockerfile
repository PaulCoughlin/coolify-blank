# Use official Node runtime
FROM node:22-slim

# Install terminal tools & process managers to keep the container alive
RUN apt-get update && apt-get install -y git curl procps && apt-get clean
RUN npm install -g pnpm

# Set the work directory
WORKDIR /app

# Create a dummy file just to keep the container running indefinitely
CMD ["tail", "-f", "/dev/null"]
