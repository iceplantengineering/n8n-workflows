FROM docker.n8n.io/n8nio/n8n:latest

USER root

# ワークフローディレクトリを作成
RUN mkdir -p /data/workflows

# ワークフローをコピー
COPY workflows/*.json /data/workflows/

# 所有者を変更
RUN chown -R node:node /data

USER node

EXPOSE 5678

ENV N8N_PROTOCOL=https
ENV N8N_PORT=5678
ENV N8N_USER_FOLDER=/data
