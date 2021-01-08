FROM python:3.9.0

WORKDIR /home/

RUN echo "testing"

RUN git clone https://github.com/kiyo254/Jintonic.git

WORKDIR /home/Jintonic

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=jin_tonic.settings.deploy && gunicorn jin_tonic.wsgi --env DJANGO_SETTINGS_MODULE=jin_tonic.settings.deploy --bind 0.0.0.0:8000"]