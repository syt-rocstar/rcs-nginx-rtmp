FROM debian:testing-slim

LABEL description="ROCSTAR - Nginx-rtmp server"

RUN apt -y update && apt -y upgrade

RUN apt -y install nginx-light libnginx-mod-rtmp

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]