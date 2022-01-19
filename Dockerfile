FROM python:3.8-alpine
COPY requirements.txt hello_there.py ./
RUN pip install -r requirements.txt
CMD [ "python","hello_there.py" ]