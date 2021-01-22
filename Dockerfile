FROM postgres:13.1
ENV POSTGRES_PASSWORD=F@ci1ityB00king
ADD ./sql/init.sql /docker-entrypoint-initdb.d/
EXPOSE 5432