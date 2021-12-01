FROM node:16.13.0-alpine3.14 as build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

RUN yarn build

FROM node:16.13.0-alpine3.14

WORKDIR /app

COPY --from=build /app/package.json /app/yarn.lock ./

RUN yarn install --prod

COPY --from=build /app/dist ./

CMD yarn start:prod
