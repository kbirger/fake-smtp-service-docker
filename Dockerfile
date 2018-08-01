FROM node:10.7-slim

RUN npm install -g fake-smtp-server@0.7.7

ENTRYPOINT ["fake-smtp-server"]