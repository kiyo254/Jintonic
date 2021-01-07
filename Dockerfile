FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/kiyo254/Jintonic.git

WORKDIR /home/Jintonic

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY=6^fnhe0l4==bj@%_3idfl_gta9u7txw!8q98w$qbrdp0*d3htn" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]