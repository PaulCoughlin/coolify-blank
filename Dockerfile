# Use official Node runtime
FROM node:22-slim

# Install terminal tools & system dependencies
RUN apt-get update && apt-get install -y git curl procps && apt-get clean

# Define the pnpm directory paths explicitly
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

# Install pnpm and OpenClaw globally
RUN npm install -g pnpm
RUN pnpm add -g openclaw@latest

# Set the work directory
WORKDIR /app

# Expose OpenClaw's internal port
EXPOSE 8080 18789

# Keep container running indefinitely so you can onboard
CMD ["tail", "-f", "/dev/null"]
