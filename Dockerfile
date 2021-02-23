FROM rasa/rasa:2.3.2-spacy-en

# Use subdirectory as working directory
WORKDIR /app

# Change back to root user to install dependencies
USER root

RUN apt-get install -y gcc && \
	apt-get autoremove -y

RUN pip install spacy==2.3.5 spacy-lookups-data --no-cache-dir

RUN python -m spacy download zh_core_web_md && \
    python -m spacy link zh_core_web_md zh

# Switch back to non-root to run code
USER 1001