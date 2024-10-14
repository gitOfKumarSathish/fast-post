# Use the official PostgreSQL image as the base
FROM postgres:alpine
RUN apk add --no-cache git postgresql-dev
# Set environment variables (can also be overridden at runtime if needed)
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydb

# Copy any needed initialization or entry scripts, if required (not used here for simplicity)
# COPY ./init-scripts /docker-entrypoint-initdb.d/

# Custom command to replicate the slave database from master
CMD bash -c "\
  until ping -c1 master-db; do sleep 1; done; \
  rm -rf /var/lib/postgresql/data/*; \
  PGPASSWORD=$POSTGRES_PASSWORD pg_basebackup -h master-db -D /var/lib/postgresql/data -U myuser -Fp -Xs -P -R; \
  chown -R postgres:postgres /var/lib/postgresql/data; \
  chmod 700 /var/lib/postgresql/data; \
  exec gosu postgres postgres"
