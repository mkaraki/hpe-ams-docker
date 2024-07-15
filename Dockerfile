FROM debian:bookworm-slim
RUN apt-get update && apt install -y curl gnupg
RUN echo "deb http://downloads.linux.hpe.com/SDR/repo/mcp bookworm/current non-free" > /etc/apt/sources.list.d/mcp.list
RUN curl http://downloads.linux.hpe.com/SDR/hpPublicKey2048.pub | apt-key add -
RUN curl http://downloads.linux.hpe.com/SDR/hpPublicKey2048_key1.pub | apt-key add -
RUN curl http://downloads.linux.hpe.com/SDR/hpePublicKey2048_key1.pub | apt-key add -
RUN apt-get clean && \
    apt-get update && \
    apt install -y amsd storcli ssa ssacli ssaducli && \
    rm -rf /var/lib/apt/lists/*
ADD start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
