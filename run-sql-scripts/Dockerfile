# Latest Sql Server version from microsoft repository
FROM mcr.microsoft.com/mssql/server:2022-latest

# Copy files to /src
COPY --chown=10001 . /src

# Set working directory to /src
WORKDIR /src

# Configure the required environmental variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=6I9G2B]LG3H2

# Expose the sql port
EXPOSE 1433

# Execute the entrypoint.sh file
CMD /bin/bash /src/entrypoint.sh
