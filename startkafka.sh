sed -i -r "s|broker.id=0|broker.id=`hostname|cut -b 6-`|g" /usr/local/kafka/config/server.properties
sed -i -r "s|zookeeper.connect=localhost:2181|zookeeper.connect=zookeeper1:2181|g" /usr/local/kafka/config/server.properties

##sed -i -r "s|^#advertised.host.name=|advertised.host.name=10.215.76.6|g" /usr/local/kafka/config/server.properties
##sed -i -r "s|^#advertised.port=|advertised.port=9092|g" /usr/local/kafka/config/server.properties

/usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
