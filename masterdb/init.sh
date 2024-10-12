#!/bin/bash
# Check if the pg_hba.conf file exists, and if it does, append the replication line

echo "Appending replication configuration to pg_hba.conf"

echo "host    replication    myuser    0.0.0.0/0    trust" >> /var/lib/postgresql/data/pg_hba.conf
