FROM alpine:latest

# 必要なパッケージのインストール
RUN apk add --no-cache curl bash git openssl tar kubectl \
    && curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash \
    && helm plugin install https://github.com/databus23/helm-diff \
    && curl -L "https://github.com/helmfile/helmfile/releases/download/v0.160.0/helmfile_0.160.0_linux_amd64.tar.gz" -o helmfile.tar.gz \
    && tar -zxvf helmfile.tar.gz -C /usr/local/bin \
    && chmod +x /usr/local/bin/helmfile \
    && rm -f helmfile.tar.gz
