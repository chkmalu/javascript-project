FROM node:10

WORKDIR /my-app

COPY /my-app /my-app

RUN npm install && npm run build

WORKDIR /api

COPY /api/package* /api/

COPY /api/server* /api/

RUN npm install 

CMD ["node","/api/server.js/"]

EXPOSE 80
