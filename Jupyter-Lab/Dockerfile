FROM alpine

# 
RUN apk add --no-cache python3 python3-dev py3-pip gcc libc-dev zeromq-dev && \
python3 -m pip install --upgrade pip setuptools wheel && \
python3 -m pip install jupyterlab

EXPOSE 8888
CMD [ "jupyter", "lab", "--allow-root", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--NotebookApp.token=''", "--NotebookApp.password=''" ]