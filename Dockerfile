FROM nginx
COPY key.pem /etc/nginx/key.pem
COPY cert.pem /etc/nginx/cert.pem
COPY nginx.conf /etc/nginx/nginx.conf
