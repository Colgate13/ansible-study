FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    python3 \
    python3-apt \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

# senha do root
RUN echo "root:senha123" | chpasswd

# usuário gabriel
RUN useradd -m -s /bin/bash gabriel \
    && echo "gabriel:senha123" | chpasswd \
    && usermod -aG sudo gabriel \
    && echo "gabriel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# usuário ansible
RUN useradd -m -s /bin/bash ansible \
    && echo "ansible:ansible" | chpasswd \
    && usermod -aG sudo ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY sshd_config /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]
