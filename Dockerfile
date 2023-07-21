FROM redis:6.0.20-alpine3.18
RUN apk update && apk add git
RUN git clone https://github.com/badtuxx/giropops-senhas.git
WORKDIR giropops-senhas/
RUN apk add redis py-pip && pip install --no-cache-dir -r requirements.txt
ENV REDIS_HOST=localhost
CMD redis-server & flask run --host=0.0.0.0
