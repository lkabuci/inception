FROM debian:bullseye-slim

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
WORKDIR /static

RUN set -x &&\
   apt-get update &&\
   apt-get install -y --no-install-recommends --no-install-suggests\
   python3=3.9.2-3 \
   python3-venv=3.9.2-3 \
   python3-pip=20.3.4-4+deb11u1 &&\
   python3 -m venv ${VIRTUAL_ENV} \
   apt-get clean && rm -rf /var/lib/apt/lists/*

COPY conf/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY conf/templates/ .
COPY conf/app.py .
COPY conf/wsgi.py .

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "wsgi:app"]
