FROM node:16-alpine

# Set working directory
WORKDIR /app

# Change ownership of npm cache folder
RUN mkdir -p /.npm \
    && chown -R 1001010000:0 /.npm

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

