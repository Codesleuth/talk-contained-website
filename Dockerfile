FROM nginx:stable-alpine as base

COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80

FROM nginx:stable-alpine

COPY --from=base /usr/share/nginx/html/ /usr/share/nginx/html/
