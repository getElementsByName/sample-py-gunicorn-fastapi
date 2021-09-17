FROM python:3

WORKDIR /workspace/app


COPY requirements.txt /workspace/install/requirements.txt
RUN pip install --no-cache-dir -r /workspace/app/requirements.txt

CMD [ "make", "start" ]