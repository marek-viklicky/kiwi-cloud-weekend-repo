# Default image for my image.
FROM nginx

# I need customize the web page, so be it. I edited the default index.html and copied it into my image.
COPY ./index.html /usr/share/nginx/html/

# I have to tell nginx about https and SSL. So I modified default vhost conf and nginx conf.
COPY ./default.conf /etc/nginx/conf.d/
COPY ./nginx.conf /etc/nginx/

# Make sure that folder for certificates exists.
RUN mkdir -p /root/certs/localhost

# Copy created certificate files to my image.
COPY ./localhost.key /root/certs/localhost/
COPY ./localhost.crt /root/certs/localhost/
