#!/bin/bash

MYSQL_USER=${MYSQL_USER:-topaz}
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-topaz}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-topaz}
MYSQL_DATABASE=${MYSQL_DATABASE:-tpzdb}
MYSQL_HOST=${MYSQL_HOST:-topaz-db}
zoneport=${zoneport}
zoneid=${zoneid}
zoneids=${zoneids}

if [[ -d /opt/build/sql ]]; then
    cd /opt/build/sql
    for f in *.sql
    do
        if [[ $f =~ ^char* ]] || [[ $f =~ ^account* ]] || [[ $f =~ ^auction_house* ]] || [[ $f =~ ^delivery_box* ]] || [[ $f =~ ^conquest_system* ]]; then
            if [[ $(mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} -sse "select count(*) from ${f%????};") -gt 0 ]]; then
                echo "${f%????} is not empty."
            else
                echo "${f%????} is empty. Updating..."
                mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < $f
            fi
        else
            echo "$f updating..."
            mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < $f
            if [[ $f =~ ^zone_settings* ]]; then
                echo "updating zone settings with ${ZONE_IP}"
                mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} -sse "update zone_settings SET zoneip = '${ZONE_IP}';"
            fi
        fi      
    done
fi


array=($(echo $zoneids | tr ',' "\n"))

for zoneid in ${array[@]}
do
    echo "updating zone settings with ${zoneid} : ${zoneport}"
    mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} -sse "update zone_settings SET zoneport = '${zoneport}' where zoneid = '${zoneid}';"
done
mysqlcheck -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} --repair ${MYSQL_DATABASE}
cd migrations
python3 migrate.py
cd ..