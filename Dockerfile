FROM rasa/rasa:latest-full
WORKDIR /app
COPY ./zh_core_web_md-2.3.1.tar.gz /app/dist/zh_core_web_md-2.3.1.tar.gz
USER root


RUN apt-get install -y gcc && \
	apt-get autoremove -y

RUN pip install spacy==2.3.5 spacy-lookups-data --no-cache-dir


RUN python -m pip install /app/dist/zh_core_web_md-2.3.1.tar.gz \
	  && python -m spacy link zh_core_web_md zh

COPY ./config.yml /app/config.yml
USER 1001