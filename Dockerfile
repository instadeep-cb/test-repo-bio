ARG JFROG_BASE_REPOSITORY
ARG JFROG_URL

FROM $JFROG_URL/$JFROG_BASE_REPOSITORY/python:3.9.7-slim

# Simulate a long build step with sleep 
RUN --mount=type=secret,id=_env,dst=/etc/secrets/.env . /etc/secrets/.env \
    && sleep 10800 \
    && pip install $PIP_INDEX_URL ray[default] tensorboardX boto3

WORKDIR /app
COPY ./src ./src
COPY main.py .
