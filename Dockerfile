# Usage from a user script:
# echo 'docker run -it --rm --mount type=bind,src=${HOME},dst=/backup sedlund/duplicacy $@' > ~/bin/duplicacy && chmod +x ~/bin/duplicacy

FROM frolvlad/alpine-glibc:alpine-3.7

# This can be just an arch and it will grab the latest version (if you change arch you'll need to use a compatible FROM image above):
ENV arch linux_x64
# ...or include a specific version to grab
#ENV arch linux_arm_2.10.0

RUN apk --no-cache add ca-certificates \
  && cd /usr/bin \
  && url=https://github.com/; wget -O duplicacy ${url}$(wget -qO- ${url}gilbertchen/duplicacy/releases | awk -F "\"" -v a=$arch '$0~a{print $2;exit}') \
  && chmod +x duplicacy

# --mount type=bind,src=/path/to/backup,dst=/backup
# or older docker
# -v /path/to/backup:/backup
#WORKDIR /backup

ENTRYPOINT ["/usr/bin/duplicacy"]
