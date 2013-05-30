# HQ MongoDB installer

This project provides a standalone installer for MongoDB. This is designed for
use in virtual machines.

It reads a configuration file and performs the following steps:

- Download a MongoDB binary distribution
- Unpack and install the MongoDB files
- Create a mongodb user
- Create directories under /var
- Create a config file
- Create an upstart script
- Ask upstart to start the service

Get it from [GitHub](https://github.com/jamespharaoh/hq-mongodb-installer) or
[RubyGems](https://rubygems.org/gems/hq-mongodb-installer).

## Usage

The script takes a single argument, which is the configuration file to use.

The script requires full sudo access with no password.

## Configuration file

Sample configuration files can be found in the test directory. The following
example should also be indicative:

	---
	install:
	  filename: mongodb-linux-x86_64-2.4.3.tgz
	  dirname: mongodb-linux-x86_64-2.4.3
	  sha1: 95bc0e0f66e64c66029b555726f4153e4b66c298
	  urls:
	  - http://192.168.222.1:8998/mongodb-linux-x86_64-2.4.3.tgz
	  target: /opt/mongodb-2.4.3
	user:
	  name: mongodb
	  create: true
	dirs:
	  - /var/log/mongodb
	  - /var/run/mongodb
	  - /var/lib/mongodb
	servers:
	  config:
		exec: mongod
		runlevels: 2345
		config: |
		  port = 27019
		  configsvr = true
		  logpath = /var/log/mongodb/mongodb.log
		  logappend = true
		  pidfilepath = /var/run/mongodb/mongodb.pid
		  dbpath = /var/lib/mongodb

You can start more than one server by adding more to the configuration file.
They will each have their own upstart script and config file on the target host.
You'll need to create separate data directories for each one.
