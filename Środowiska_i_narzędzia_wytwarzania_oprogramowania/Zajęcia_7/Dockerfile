from python

WORKDIR /root/

#ADD https://github.com/SMCEBI-didactics/WebApp/archive/refs/tags/v1.0.tar.gz .
COPY WebApp .


RUN pip install -r requirements.txt
ENTRYPOINT  ["flask", "run"]
