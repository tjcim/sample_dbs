FROM node:latest

RUN mkdir -p /app
WORKDIR /app
COPY package*.json ./

RUN npm install
EXPOSE 4000

COPY . .

CMD ["npm", "start"]
