# Latest Sql Server version from microsoft repository
FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

# Install update
RUN apt-get update

# Add the DACPAC to the image
COPY sfwmdc43dbdev-2023-3-29-9-28.bacpac /src/sfwmdc43dbdev-2023-3-29-9-28.bacpac
COPY db-init.sh /src/db-init.sh
COPY entrypoint.sh /src/entrypoint.sh

# Configure the required environmental variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Chance#Demo

# Expose the sql port
EXPOSE 1433

# Execute the entrypoint.sh file
CMD /bin/bash /src/entrypoint.sh
