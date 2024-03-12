FROM alpine:latest

RUN apk update && apk add jq curl

COPY downloader.sh /app/downloader.sh
COPY data_extractor.sh /app/data_extractor.sh
COPY html_generator.sh /app/html_generator.sh

WORKDIR /app

CMD ["sh", "downloader.sh"]
