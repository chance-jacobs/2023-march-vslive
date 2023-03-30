FROM mcr.microsoft.com/mssql/server:2022-latest
WORKDIR /code
COPY --chown=10001 . /code/
CMD /bin/bash /code/entrypoint.sh
