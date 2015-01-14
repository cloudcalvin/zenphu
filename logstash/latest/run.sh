#!/bin/bash

if [ ! -f /.logstash_db_configured ]; then
    /set_logstash_config.sh
fi

echo "=> Starting and running Logstash..."
cd opt/logstash
bin/logstash -f logstash.conf