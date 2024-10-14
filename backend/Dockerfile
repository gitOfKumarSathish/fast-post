FROM python:3.11-slim
ARG GITLAB_ACCESS_TOKEN
RUN apt update && apt install -y git libpq-dev build-essential inetutils-ping
ENV POSTGRESQL_DATABASE_MASTER_URL="postgresql+asyncpg://myuser:mypassword@master.db/mydb"
ENV POSTGRESQL_DATABASE_SLAVE_URL="postgresql+asyncpg://myuser:mypassword@slave.db/mydb"
WORKDIR /app
RUN git clone https://oauth2:$GITLAB_ACCESS_TOKEN@gitlab.com/succeedex/backend-crm.git /app
RUN pip install -r requirements.txt
COPY traefik.sh /usr/local/bin/traefik.sh
RUN chmod +x /usr/local/bin/traefik.sh
CMD ["/usr/local/bin/traefik.sh"]

#docker compose build backend  --build-arg GITLAB_ACCESS_TOKEN=<token> --no-cache
