FROM node:18
# Setup working directory
WORKDIR /app
# Copy package.json to working directory
COPY package.json ./
# Install npm dependencies optimized for production
RUN npm install --omit=dev
# Copy current directory to the container working directory
COPY . .
# Build
RUN npm run build
# Expose
EXPOSE 3000
# Run startup command
CMD node build/index.js