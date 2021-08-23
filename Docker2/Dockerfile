FROM node:14-alpine

WORKDIR /modules
COPY tmp/*.tgz .

WORKDIR /app
RUN npm init -y
RUN npm install --production --save /modules/*td-tool*.tgz
RUN npm install --production --save /modules/*core*.tgz
RUN npm install --production --save /modules/*binding*.tgz
RUN npm install --production --save /modules/*cli*.tgz
RUN echo "@sterfive:registry=http://gitlab.sterfive.fr:4873" > .npmrc
RUN
RUN npm install --production --save node-opcua node-opcua-types
WORKDIR /app/node_modules/@node-wot/cli

EXPOSE 8080/tcp
EXPOSE 5683/udp

STOPSIGNAL SIGINT

ENTRYPOINT [ "node", "dist/cli.js" ]
CMD [ "-h" ]
