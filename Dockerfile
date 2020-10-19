FROM node:13-alpine as build-stage
LABEL maintainer=nicolas.petitot@developpement-durable.gouv.fr

ENV dir /app
WORKDIR $dir

COPY package*.json ./
RUN npm ci

COPY src src/
