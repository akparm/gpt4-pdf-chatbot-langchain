# Image
FROM node:16-alpine

# Set working directory
WORKDIR /usr/src/app

# Set environment variable for npm cache directory
ENV NPM_CONFIG_CACHE=/usr/src/app/.npm

# Create npm cache directory
RUN mkdir -p $NPM_CONFIG_CACHE \
    && chown -R node:node $NPM_CONFIG_CACHE

# Install dependencies
COPY package.json ./
RUN npm install

# Copy project files
COPY . .

# Build the Next.js app
RUN npm run build

# Expose port
EXPOSE 3000

# Run the server
CMD ["npm", "start"]
