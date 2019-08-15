FROM python:3.6.8-stretch

RUN apt-get update &&\
    apt-get install -y vim &&\
    apt-get install htop

ENV main_dir /usr/src/app
RUN mkdir -p ${main_dir}
ADD jupyter/requirements.txt ${main_dir}
WORKDIR ${main_dir}

RUN pip install -r requirements.txt &&\
    pip install https://github.com/Jupyter-contrib/jupyter_nbextensions_configurator/tarball/master &&\
    jupyter contrib nbextension install --system &&\
    pip install jupyter_contrib_nbextensions &&\
    pip install RISE &&\
    jupyter-nbextension install rise --py --sys-prefix