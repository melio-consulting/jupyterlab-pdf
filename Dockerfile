FROM gcr.io/kubeflow-images-public/tensorflow-2.1.0-notebook-cpu:1.0.0

USER root
WORKDIR /app
RUN pip install --upgrade  pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get -y install ghostscript

RUN pip install jupyterlab==3.0.12 --upgrade
RUN jupyter labextension install \
    @axlair/jupyterlab_vim \
    @lckr/jupyterlab_variableinspector

USER jovyan
ENV NB_PREFIX /
CMD ["sh","-c", "jupyter lab --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]
