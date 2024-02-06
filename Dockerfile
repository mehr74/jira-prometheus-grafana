FROM debian:buster-slim

ARG python_version=3.8.2
ENV PYTHON_VERSION ${python_version}

RUN apt update && \
    apt install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install prometheus_client jira

COPY ./classes /classes

COPY main.py /entrypoint.py

CMD ["/entrypoint.py"]
ENTRYPOINT ["python3"]