FROM python:3.9.0

WORKDIR /home/

RUN echo "testing"

RUN git clone https://github.com/kiyo254/Jintonic.git

WORKDIR /home/Jintonic

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=6^fnhe0l4==bj@%_3idfl_gta9u7txw!8q98w$qbrdp0*d3htn" > .env

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=jin_tonic.settings.deploy && gunicorn jin_tonic.wsgi --env DJANGO_SETTINGS_MODULE=jin_tonic.settings.deploy --bind 0.0.0.0:8000"]