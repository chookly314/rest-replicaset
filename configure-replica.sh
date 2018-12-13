#!/bin/bash

# wait until the databases are up and running
sleep 5

# configure the replica set
mongo --host <primary_member_host>:27017 --eval "rs.initiate({
		_id : '<replica-set-id>',
		protocolVersion: 1,
		members: [  { _id : <member_id>, host : '<primary_member_host>:27017'},
					{ _id : <member_id>, host : '<member_host>:27017'},
					{ _id : <member_id>, host : '<member_host>:27017'}
				 ],
		settings: {electionTimeoutMillis: 1000}
	})"

sleep 3

# import the restaurants collection
mongoimport --host <replica-set-id>/<primary_member_host>:27017,<member_host>:27017,<member_host>:27017 -d zips_small -c restaurants < /opt/zips_small.json
