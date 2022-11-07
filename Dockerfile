FROM python:3.9

COPY . /

WORKDIR /

RUN pip install mkdocs
RUN pip install mkdocs-material

EXPOSE 1234

CMD ["mkdocs", "serve"]