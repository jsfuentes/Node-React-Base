FROM node:10.11.0-alpine

# Set the working directory to /app
WORKDIR /app

COPY package.json .
COPY yarn.lock .

# Install any needed packages specified
RUN yarn install

RUN yarn add react-scripts@1.1.1 -g --silent

# Copy the current directory contents into the container at /app
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 3000

# start app
CMD ["yarn", "start"]