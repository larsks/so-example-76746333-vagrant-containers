FROM roboxes/rhel8

COPY docker-entrypoint.sh /usr/local/bin/
RUN useradd vagrant && \
	echo 'vagrant:*LOCKED*' | chpasswd -e
RUN mkdir -p /home/vagrant/.ssh && \
	chmod 700 /home/vagrant/.ssh && \
	curl -sSf -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub && \
	chmod 600 /home/vagrant/.ssh/authorized_keys && \
	chown -R vagrant /home/vagrant
RUN echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant && \
	chmod 440 /etc/sudoers.d/vagrant
RUN printf '#VAGRANT-BEGIN\n#VAGRANT-END\n' >> /etc/fstab
ENTRYPOINT ["sh", "/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
