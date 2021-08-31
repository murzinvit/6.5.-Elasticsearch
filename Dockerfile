FROM centos:7
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
RUN cd /opt && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-x86_64.rpm
RUN cd /opt && yum -y install elasticsearch-7.14.0-x86_64.rpm
RUN useradd elastic -s /bin/bash -m && usermod elastic -aG root
RUN chmod -R 777 /etc/sysconfig/elasticsearch
RUN chmod -R 777 /etc/elasticsearch
RUN chmod -R 777 /var/log/elasticsearch
RUN chmod -R 777 /var/lib/elasticsearch
RUN chmod -R 777 /usr/share/elasticsearch/
RUN chmod -R 777 /var/lib
RUN echo "path.data: /var/lib" > /etc/elasticsearch/elasticsearch.yml
RUN echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "http.port: 9200" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "discovery.type: single-node" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "node.name: netology_test" >> /etc/elasticsearch/elasticsearch.yml
RUN cd /etc/rc.d/init.d/ && chkconfig --add elasticsearch
RUN echo "PATH=$PATH:/etc/rc.d/init.d/" >> /etc/environment
RUN echo "export PATH=$PATH:/etc/rc.d/init.d/" > /etc/profile.d/elk.sh && chmod 777 /etc/profile.d/elk.sh
CMD /etc/rc.d/init.d/elasticsearch start && sleep 6000000
EXPOSE 9200
EXPOSE 9300
