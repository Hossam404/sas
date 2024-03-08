# Use the official Node.js image as the base image
FROM node:latest

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY ./ .

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run your app
CMD ["node", "index.js"]
