
# build à partir d'une image 'node'

FROM node:13-alpine as build-stage
LABEL maintainer=nicolas.petitot@developpement-durable.gouv.fr

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY index.js ./
COPY template.html ./
COPY webpack.config.js ./
COPY .babelrc ./

RUN npm run build

# serveur nginx à partir d'une image nginx

FROM nginx:alpine as production-stage
WORKDIR /app

COPY --from=build-stage /app/dist ./app

COPY src src/
