# FROM node:14.18-buster-slim
FROM nginx
LABEL MAINTAINER="DevOps  <devops@gteam.com>"

### ESSENTIAL PACKAGES
ENV DEBIAN_FRONTEND=noninteractive

### INSTAÇÃO DE PACOTES ESSENCIAIS ###
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    tzdata \
    && cp -rp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && rm -rf /var/lib/apt/lists/* ;

### NGINX SETTINGS
COPY build/confs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY build/confs/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
RUN rm -rf /var/log/nginx/*.log \
    rm -rf /var/www/html

### FLUENTBIT INSTALLATION
RUN curl https://packages.fluentbit.io/fluentbit.key | apt-key add - \
    && echo "deb https://packages.fluentbit.io/debian/buster buster main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install td-agent-bit -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/log/fluentbit;

COPY build/confs/fluentbit/ /etc/fluentbit/

#### COPIANDO SCRIPTS DE INICIALIZAÇÃO ###
COPY build/scripts/start.sh /start.sh

### INICIALIZANDO ###
EXPOSE 80
CMD ["/bin/bash", "/start.sh"]
