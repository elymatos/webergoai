FROM tiangolo/uvicorn-gunicorn:python3.7

WORKDIR /ergo

RUN apt-get update --fix-missing -y
RUN apt install default-jdk -y
RUN wget https://github.com/ErgoAI/.github/releases/download/v3.0_release/ergoAI_3.0.run
RUN echo y | sh ergoAI_3.0.run

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY ./app /app