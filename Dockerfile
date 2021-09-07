FROM node:6 as builder
WORKDIR /usr/app
COPY package*.json package-lock.json ./
RUN npm install
COPY . .


FROM nginx:alpine
COPY --from=builder /usr/app/nginx/*  /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/app/dist/* /usr/share/nginx/html/

