# Use the official Postgres image as the base
FROM postgres:latest

# Set environment variables for Postgres (these will be overwritten by Docker Compose)
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydb

# Copy the custom script to append configuration to pg_hba.conf
COPY ./init.sh /docker-entrypoint-initdb.d/init.sh
RUN chmod +x /docker-entrypoint-initdb.d/init.sh

# Copy custom pg_hba.conf file
COPY ./pg_hba.conf /docker-entrypoint-initdb.d/pg_hba.conf

# Define custom postgres command to run on container startup
CMD ["postgres", "-c", "wal_level=replica", "-c", "max_wal_senders=3", "-c", "max_replication_slots=3"]
