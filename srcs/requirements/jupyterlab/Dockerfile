# Jupiter
FROM debian:bullseye-slim

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
WORKDIR /jupiter

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

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''"]