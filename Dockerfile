FROM registry.access.redhat.com/ubi8/ubi:8.5

RUN dnf -y install nginx && \
    dnf clean all

COPY index.html hawtconfig.json /usr/share/nginx/html/hawtio/
COPY dist/ /usr/share/nginx/html/hawtio/dist/
COPY node_modules/ /usr/share/nginx/html/hawtio/node_modules/

# redirect / -> /hawtio/
RUN echo '<meta http-equiv="refresh" content="0;URL=/hawtio/">' > /usr/share/nginx/html/index.html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
