##### BASE IMAGE #####
FROM python:3.8-slim

##### METADATA #####
LABEL base.image="python:3.8-slim"
LABEL software="zgtf"
LABEL software.description="gtf conversion utlity"
LABEL software.website="https://github.com/zavolanlab/zgtf"
LABEL software.documentation="https://github.com/zavolanlab/zgtf"
LABEL software.license="https://github.com/zavolanlab/zgtf/blob/master/LICENSE"
LABEL software.tags="Genomics,Transcriptomics"
LABEL maintainer="foivos.gypas@unibas.ch"
LABEL maintainer.organisation="Biozentrum, University of Basel"
LABEL maintainer.location="Klingelbergstrasse 50/70, CH-4056 Basel, Switzerland"
LABEL maintainer.lab="Zavolan Lab"
LABEL maintainer.license="Apache License 2.0"

COPY scripts scripts
COPY zgtf zgtf
COPY requirements.txt .
COPY setup.py .

##### INSTALL #####
RUN apt-get update \
  && apt-get install -y apt-utils gcc make zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev \
  && python setup.py install
