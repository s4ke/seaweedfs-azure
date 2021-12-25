FROM chrislusf/seaweedfs:latest
RUN apk add gettext
COPY s3.json.template /etc/seaweedfs/s3.json.template
ENTRYPOINT []
CMD envsubst < /etc/seaweedfs/s3.json.template > /etc/seaweedfs/s3.json && exec weed server -s3 -s3.config=/etc/seaweedfs/s3.json -s3.port=8000
