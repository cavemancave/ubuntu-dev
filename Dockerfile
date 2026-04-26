FROM ubuntu:22.04

# 避免交互式安装提示
ENV DEBIAN_FRONTEND=noninteractive

# 替换 apt 源
COPY sources.list /etc/apt/sources.list

# 更新并安装基础工具
RUN apt-get update && apt-get install -y \
    sudo \
    vim \
    git \
    curl \
    wget \
    build-essential \
    gdb \
    llvm \
    clang \
    clangd \
    cmake \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# 配置 SSH
RUN mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

# 创建用户 taishan (UID 1000, 与 Windows 常用 UID 对齐)
RUN useradd -m -s /bin/bash -u 1000 taishan && \
    echo "taishan:taishan" | chpasswd && \
    usermod -aG sudo taishan

# 配置 sudo 免密码
RUN echo "taishan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 设置工作目录
WORKDIR /home/taishan/workspace

CMD ["/entrypoint.sh"]