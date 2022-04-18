#!/bin/bash

### FLUENTBIT STARTUP VALIDATION
if [[ -n "$ENVIRONMENT" && -n "$APPLICATION" && -n "$ES_LOG_HOST" ]]; then
    printf "\n\nStarting Fluentbit Agent...\n\n"
    /opt/td-agent-bit/bin/td-agent-bit -c /etc/fluentbit/service.conf
fi

cd /var/www

if [[ $APP_ENV = "local" ]] ; then
    printf "Starting App DEV...\n\n"
    apt update && apt install -y npm
    npm run dev > /dev/null &
else
    printf "Starting App PRD...\n\n"
fi

printf "Starting Nginx...\n\n"
set -e

nginx "-g" "daemon off;"
