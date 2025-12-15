FROM python:3.14.2-alpine3.23

ENV PYTHONUNBUFFERED=1

COPY src/requirements.txt /tmp/requirements.txt
RUN apk --update --no-cache upgrade && \
    apk --update --no-cache add \
        build-base \
        openldap-dev \
        libffi-dev && \
    rm -rf /var/cache/apk/* && \
    pip install --upgrade --no-cache-dir pip setuptools && \
    pip install --upgrade --no-cache-dir -r /tmp/requirements.txt

# Run as non-root
ENV USER=aldap
ENV UID=10001
ENV GROUP=aldap
ENV GID=10001
ENV HOME=/home/$USER
RUN addgroup -g $GID -S $GROUP && adduser -u $UID -S $USER -G $GROUP

# Python code
COPY src/* $HOME/
RUN chown -R $USER:$GROUP $HOME

EXPOSE 9000
USER $UID:$GID
WORKDIR $HOME
CMD ["python3", "-u", "main.py"]
