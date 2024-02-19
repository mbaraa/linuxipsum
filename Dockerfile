FROM nginx:1.23.3-alpine
COPY ./src/* /usr/share/nginx/html/
