FROM alpine:3.7

RUN apk --no-cache add \
  bash=4.4.19-r1 \
  ca-certificates=20190108-r0 \
  curl=7.61.1-r3 \
  git=2.15.4-r0 \
  jq=1.5-r5 \
  openssh-client=7.5_p1-r10

# can't `git pull` unless we set these
RUN git config --global user.email "git@localhost" && \
    git config --global user.name "git"

COPY scripts/install_git_lfs.sh install_git_lfs.sh
RUN ./install_git_lfs.sh

COPY assets /opt/resource
