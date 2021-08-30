FROM centos:7
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel
RUN cd / && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-linux-x86_64.tar.gz
RUN cd / && tar -xvzf elasticsearch-7.14.0-linux-x86_64.tar.gz
RUN chmod -R 777 /var/lib && chmod -R 777 /elasticsearch-7.14.0
RUN echo "node.name: netology_test" >> /elasticsearch-7.14.0/config/elasticsearch.yml
RUN echo "path.data: /var/lib" >> /elasticsearch-7.14.0/config/elasticsearch.yml
RUN echo "network.host: 0.0.0.0" >> /elasticsearch-7.14.0/config/elasticsearch.yml
RUN echo "http.port: 9200" >> /elasticsearch-7.14.0/config/elasticsearch.yml
RUN echo "discovery.type: single-node" >> /elasticsearch-7.14.0/config/elasticsearch.yml
RUN useradd elastic -s /bin/bash -m
CMD ["java", "/elasticsearch-7.14.0/bin/elasticsearch -d"]
EXPOSE 9200
EXPOSE 9300