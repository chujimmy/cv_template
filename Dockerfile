FROM pandoc/latex

WORKDIR /

# Install python
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Install latex dependencies
RUN tlmgr update --self
RUN tlmgr install texliveonfly
