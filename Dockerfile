FROM rasa/rasa:latest-full
WORKDIR /app
COPY ./zh_core_web_md-2.3.1.tar.gz /app/dist/zh_core_web_md-2.3.1.tar.gz
USER root
RUN python -m pip install /app/dist/zh_core_web_md-2.3.1.tar.gz
RUN python -m spacy link zh_core_web_md zh

COPY ./config.yml /app/config.yml
USER 1001