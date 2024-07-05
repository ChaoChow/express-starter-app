# Common build stage
FROM node:20-bookworm-slim as common-build-stage

COPY ./dist/src ./src
COPY ./package.json ./package.json
COPY ./yarn.lock.json ./yarn.lock.json

WORKDIR /src

RUN yarn install --production --frozen-lockfile

# Production build stage
FROM common-build-stage as production-build-stage

ENV NODE_ENV production

CMD ["node", "src/app.js"]
