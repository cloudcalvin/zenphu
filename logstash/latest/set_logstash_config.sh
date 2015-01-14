#!/bin/bash
sed -i -e "s/<--INPUT_PORT_UNITACTOR-->/${INPUT_PORT_UNITACTOR}/g" \
    -e "s/<--INPUT_PORT_ZEROMQCLIENT-->/${INPUT_PORT_ZEROMQCLIENT}/g" \
    -e "s/<--OUTPUT_HOST-->/${OUTPUT_HOST}/g" \
    -e "s/<--OUTPUT_PORT-->/${OUTPUT_PORT}/g" /opt/logstash/logstash.conf
touch /.logstash_db_configured

echo "=> Logstash has been configured as follows:"
echo "   Logstash TCP Input UnitActor:		${INPUT_PORT_UNITACTOR}"
echo "   Logstash TCP Input ZeroMQClient:	${INPUT_PORT_ZEROMQCLIENT}"
echo "   Logstash UDP Output Host:		  	${OUTPUT_HOST}"
echo "   Logstash UDP Output Port:			${OUTPUT_PORT}"
echo "=> Done!"
