FROM docker.io/alpine:latest

RUN apk add openssh openssh-server bash sudo
COPY docker-entrypoint.sh /usr/local/bin/
RUN adduser -D vagrant && \
	echo 'vagrant:*LOCKED*' | chpasswd -e
RUN mkdir -p /home/vagrant/.ssh && \
	chmod 700 /home/vagrant/.ssh && \
	wget -O /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub && \
	chmod 600 /home/vagrant/.ssh/authorized_keys && \
	chown -R vagrant /home/vagrant
RUN echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant && \
	chmod 440 /etc/sudoers.d/vagrant
RUN printf '#VAGRANT-BEGIN\n#VAGRANT-END\n' >> /etc/fstab
ENTRYPOINT ["sh", "/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
