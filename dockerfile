FROM node:alpine as build

WORKDIR /usr/frontend

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx

COPY --from=build /usr/frontend/build /usr/share/nginx/html