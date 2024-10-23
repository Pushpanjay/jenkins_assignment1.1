From node:latest
WORKDIR /apps
ADD . .
RUN npm install
CMD ["node","app.js"]
