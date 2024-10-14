FROM python:3.11-alpine
ARG GITLAB_ACCESS_TOKEN
RUN apk add --no-cache git postgresql-dev 
ENV POSTGRESQL_DATABASE_MASTER_URL="postgresql+asyncpg://myuser:mypassword@master.db/mydb"
ENV POSTGRESQL_DATABASE_SLAVE_URL="postgresql+asyncpg://myuser:mypassword@slave.db/mydb"
WORKDIR /app
# RUN git clone https://oauth2:$GITLAB_ACCESS_TOKEN@gitlab.com/succeedex/backend-crm.git /app
RUN git clone https://github.com/Anish13kumar/Fastapi_PostgreSQL .
RUN pip install -r requirement.txt
COPY traefik.sh /usr/local/bin/traefik.sh
RUN chmod +x /usr/local/bin/traefik.sh
CMD ["/usr/local/bin/traefik.sh"]

#docker compose build backend  --build-arg GITLAB_ACCESS_TOKEN=<token> --no-cache
