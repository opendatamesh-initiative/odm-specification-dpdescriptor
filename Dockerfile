FROM python:3.9

COPY . /

WORKDIR /

RUN pip install -U mkdocs-material
RUN pip install -U mkdocs-git-revision-date-localized-plugin
RUN pip install -U pillow cairosvg
RUN apt-get install libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libz-dev
RUN pip install -U json-schema-for-humans

EXPOSE 1234

CMD ["mkdocs", "serve"]