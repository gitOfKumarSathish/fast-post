FROM python:3.11-slim
ARG GITLAB_ACCESS_TOKEN
# Install necessary packages including ping
RUN apt update && apt install -y git libpq-dev build-essential inetutils-ping

# Set working directory
WORKDIR /app

# Clone the repository
# RUN git clone https://github.com/Anish13kumar/Fastapi_PostgreSQL .

RUN git clone https://oauth2:$GITLAB_ACCESS_TOKEN@gitlab.com/succeedex/backend-crm.git /app

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the script into the container
COPY traefik.sh /usr/local/bin/traefik.sh

# Make the script executable
RUN chmod +x /usr/local/bin/traefik.sh

# Run the shell script at container startup
CMD ["/usr/local/bin/traefik.sh"]


# CMD ["tail", "-f", "/dev/null"]
