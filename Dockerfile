FROM node:10 AS frontend
WORKDIR /my-app/
COPY my-app/ /my-app
RUN npm install && npm run build


FROM node:10 AS backend
RUN mkdir /my-app
COPY --from=frontend my-app/ /my-app/
RUN mkdir /api
WORKDIR /api/
COPY api/package* /api/
COPY api/server* /api/
RUN npm install
CMD [ "npm", "start" ]
EXPOSE 80