#base image 
FROM ubuntu:latest

#run kører en kommando inde i containeren 
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev

# kopier alt ind i containeren - pip installer det er der i filen
COPY . /ca-projects
RUN pip install --no-cache-dir -r /ca-projects/requirements.txt

# porten som containeren lytter på 
EXPOSE 5000

#kører containeren - og hvad den skal kører - her kører web applikationen
CMD ["python", "/ca-projects/run.py"]
