FROM node:16.13.0-alpine3.14

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --prod

COPY . ./

RUN yarn build

CMD yarn start:prod
