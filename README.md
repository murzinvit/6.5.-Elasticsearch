### 6.5_Elasticsearch </br>
------------------------------------------------ </br>
#### Задача 1:
1) Докерфайл для запуска контейнера с elastic [Dockerfile](https://github.com/murzinvit/6.5_Elasticsearch/blob/b410ec0390e8e348526bbc4508b1f5363346152b/Dockerfile) </br>
2) Команда для запуска: `docker run -d --name elasic -p 9200:9200 -p 9300:9300 murzinvit/elasticsearch:latest` </br>
3) Образ на hub.docker.com [https://hub.docker.com/repository/docker/murzinvit/elasticsearch](https://hub.docker.com/repository/docker/murzinvit/elasticsearch) </br>
4) Недостаток памяти исправил командой(выполнять на хосте) - `echo "vm.max_map_count=262144" >> /etc/sysctl.conf && sysctl -p` </br>

### Ответ на curl localhost:9200 </br>
![screen](https://github.com/murzinvit/screen/blob/7a1e0db8094655db237f06c9a3534b3478571282/Elastic_screen_curl_9200.png)

#### Задача 2: </br>
Документация по запросам к Elasticsearch: [www.elastic.co/guide/en/elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices.html) </br>
Запросы к Elastic можно отправлять через curl в cmd, или по http через браузер </br>
Создать индекс можно запросом: [elastic_put](https://github.com/murzinvit/6.5_Elasticsearch/blob/3f12afa445fb49343759627298eb581b4ff94725/elastic_put) </br>
Получить список индексов и статусов можно запросом: `curl -X GET "localhost:9200/_cat/indices?v"` </br>
Получить состояние кластера: `curl -X GET "localhost:9200/_cluster/health"` </br>
Часть индексов и сам кластер находятся в состоянии yellow т.к single-node и данные не реплицированы </br>
Удаление всех индексов: `curl -X DELETE "localhost:9200/_all"` </br>

#### Задача 3: </br>



