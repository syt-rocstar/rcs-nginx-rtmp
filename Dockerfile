FROM debian:testing-slim

LABEL description="ROCSTAR - Nginx-rtmp server"

RUN apt -y update && apt -y upgrade

RUN apt -y install nginx-light libnginx-mod-rtmp

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 1935

CMD ["nginx", "-g", "daemon off;"]