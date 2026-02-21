# Use official lightweight Node.js image (Alpine version)
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy dependency file first (better layer caching)
COPY package.json .

# Install Node.js dependencies
RUN npm install

# Copy application source code
COPY app.js .

# Inform Docker that the container listens on port 8080
EXPOSE 8080

# Command to run the application
# JSON format is recommended to handle OS signals correctly
CMD ["node", "app.js"]
