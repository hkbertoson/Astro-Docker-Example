# Use Node.js LTS version
FROM node:lts-alpine AS runtime
WORKDIR /app

# Copy all project files to the container
COPY . .

# Install dependencies using npm
RUN npm install

# Build the project using npm
RUN npm run build

# Set environment variables for the host and port
ENV HOST=0.0.0.0
ENV PORT=4321

# Expose port 4321
EXPOSE 4321

# Command to run the server
CMD ["node", "./dist/server/entry.mjs"]
