FROM python:3.7-alpine
MAINTAINER "Sasho Savkov" <sasho.savkov@babylonhealth.com>

RUN apk add --update --no-cache pcre-dev && \
    apk --update add --virtual build-dependencies python3-dev build-base linux-headers && \
    pip install pandas==1.0.3
