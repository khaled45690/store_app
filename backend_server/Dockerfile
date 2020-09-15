FROM node:12
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD node index.js --bind 0.0.0.0:$PORT
