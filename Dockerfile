FROM node:14.15.5-alpine3.10 as build

COPY package.json package-lock.json ./
RUN npm install

COPY ./ ./
RUN npm run build
RUN npm prune --production

FROM node:14.15.5-alpine3.10
COPY --from=build /dist/ ./dist/
COPY --from=build /node_modules/ ./node_modules/

EXPOSE 3000
CMD node ./dist/server.js