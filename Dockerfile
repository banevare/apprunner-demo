FROM --platform=linux/x86_64 node:10
# Create app directory
WORKDIR /app
# Install app dependencies
# A wildcard is use to ensure both package.jason AND package-lock.json are
#copied where available
COPY package*.json ./

RUN npm install
# Bundle app source
COPY . /app

EXPOSE 3000
CMD ["node","node.js"]