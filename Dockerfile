FROM bde2020/spark-worker:2.1.0-hadoop2.8-hive-java8

ADD src/test/resources/input.txt /project/data/input.txt
ADD deployData.sh /deployData.sh

RUN chmod 755 /deployData.sh

CMD ["/deployData.sh"]
