FROM python:3.8-alpine
RUN pip install -r requirements.txt
COPY hello_there.py /
CMD [ "python","hello_there.py" ]
