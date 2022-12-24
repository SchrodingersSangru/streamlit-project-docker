# app/Dockerfile

FROM python:3.9-slim

EXPOSE 8501


RUN mkdir streamlit-example-master

COPY . /streamlit-example-master


WORKDIR /streamlit-example-master

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# RUN git clone https://github.com/streamlit/streamlit-example.git .

RUN pip3 install -r requirements.txt

ENTRYPOINT ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]

# /home/sangram/Downloads/hello-main/Hello.py


## commands to run
# sudo docker build -t streamlit .
# sudo docker run -p 8501:8501 streamlit