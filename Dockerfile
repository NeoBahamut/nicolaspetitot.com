# multi staging

# build à partir d'une image 'node'
FROM node:13-alpine as build-stage
LABEL maintainer=nicolas.petitot@developpement-durable.gouv.fr

WORKDIR /app

# copie de package.json et package-lock.json afin d'effectuer les installations npm nécessaires
COPY package*.json ./
RUN npm ci

# copie des sources
COPY index.js ./
COPY template.html ./
COPY webpack.config.js ./
COPY .babelrc ./

# build de l'application
RUN npm run build

# serveur nginx à partir d'une image nginx
FROM nginx:alpine as production-stage
WORKDIR /app

# copie du répertoire /dist issu de la compilation précédente
COPY --from=build-stage /app/dist ./app