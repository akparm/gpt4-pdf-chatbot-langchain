FROM --platform=linux/amd64 node:latest

# Set working directory
WORKDIR /app

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

