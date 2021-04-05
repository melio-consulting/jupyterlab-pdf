FROM jupyter/tensorflow-notebook:4d9c9bd9ced0

WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

USER root

RUN apt-get update && apt-get -y install ghostscript

RUN jupyter labextension install \
    @axlair/jupyterlab_vim \
