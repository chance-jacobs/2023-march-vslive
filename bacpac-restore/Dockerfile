# Latest Sql Server version from microsoft repository
FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

# Install Unzip
RUN apt-get update
RUN apt-get install unzip -y

# Add the DACPAC to the image
COPY sfwmdc43dbdev-2023-3-29-9-28.bacpac /tmp/sfwmdc43dbdev-2023-3-29-9-28.bacpac
COPY postCreateCommand.sh /tmp/postCreateCommand.sh
COPY db-init.sh /tmp/db-init.sh
COPY entrypoint.sh /tmp/entrypoint.sh

# Configure external build arguments to allow configurability.
ARG DBNAME=Database
ARG PASSWORD

# Configure the required environmental variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=$PASSWORD



# Expose the sql port
EXPOSE 1433

# Execute the entrypoint.sh file
CMD /bin/bash /tmp/entrypoint.sh
