FROM nginx:1.25.5


COPY nginx-config/default.conf /etc/nginx/conf.d/

COPY src /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]