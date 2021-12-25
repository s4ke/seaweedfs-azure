FROM chrislusf/seaweedfs:latest
RUN apk add gettext
COPY s3.json.template /etc/seaweedfs/s3.json.template
ENTRYPOINT []
ENV SEAWEEDFS_PUBLIC_BUCKET_NAME=mybucket
ENV SEAWEEDFS_ACCESS_KEY=admin
ENV SEAWEEDFS_SECRET_KEY=adminSecret
CMD envsubst < /etc/seaweedfs/s3.json.template > /etc/seaweedfs/s3.json && exec weed server -s3 -s3.config=/etc/seaweedfs/s3.json -s3.port=8000
