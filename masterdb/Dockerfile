# Use the official Postgres image as the base
FROM postgres:alpine

ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_DB
# Set environment variables for Postgres (these will be overwritten by Docker Compose)
ENV POSTGRES_USER=$POSTGRES_USER
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ENV POSTGRES_DB=$POSTGRES_DB

# Copy the custom script to append configuration to pg_hba.conf
COPY ./init.sh /docker-entrypoint-initdb.d/init.sh
RUN chmod +x /docker-entrypoint-initdb.d/init.sh

# Define custom postgres command to run on container startup
CMD ["postgres", "-c", "wal_level=replica", "-c", "max_wal_senders=3", "-c", "max_replication_slots=3"]
