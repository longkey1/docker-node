FROM node:latest

# Fix frontend not set error
ARG DEBIAN_FRONTEND=noninteractive

# Confirm node version
RUN node -v

# Install gosu
RUN apt-get -y update && apt-get -y install gosu

# Set Entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
