FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/
COPY .env ./

RUN export $(cat .env | xargs) && rm .env && chmod +x /var/www/mariadb_start.sh

ENTRYPOINT [ "/var/www/mariadb_start.sh" ]

CMD ["mysqld"]
