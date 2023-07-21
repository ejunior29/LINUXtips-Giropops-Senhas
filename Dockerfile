FROM alpine:3.15.9
COPY ./giropops-senhas /giropops-senhas
WORKDIR /giropops-senhas
RUN apk update && apk add redis py-pip && pip install --no-cache-dir -r /giropops-senhas/requirements.txt
ENV REDIS_HOST=172.17.0.2
ENTRYPOINT flask run --host=0.0.0.0
