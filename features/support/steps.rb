require "shellwords"

Before do
	@vagrant_boxes = []
end

When /^I start vagrant box "(.*?)"$/ do
	|box_name|
	@vagrant_boxes << box_name
	system "vagrant up #{box_name}"
end

After do
	@vagrant_boxes.each do
		|box_name|
		system "vagrant destroy #{box_name} --force"
	end
end

When /^I install mongo on "(.*?)" with "(.*?)"$/ do
	|server, config|
	command_run [
		"vagrant", "ssh",
		server,
		"--command", [
			"/vagrant/bin/hq-mongodb-installer",
			"/vagrant/test/#{config}",
		].shelljoin
	].shelljoin
end

When /^I run mongo "(.*?)" script "(.*?)" on "(.*?)"$/ do
	|version, script, server|

	command_run [
		"vagrant", "ssh",
		server,
		"--command", [
			"/opt/mongodb-#{version}/bin/mongo",
			"/vagrant/test/#{script}",
		].shelljoin
	].shelljoin

end

Then /^mongo "(.*?)" test script "(.*?)" should work on "(.*?)"$/ do
	|version, script, server|

	command_run [
		"vagrant", "ssh",
		server,
		"--command", [
			"/opt/mongodb-#{version}/bin/mongo",
			"/vagrant/test/#{script}",
		].shelljoin
	].shelljoin

	@command_stdout.should include "hello world"

end

Then /^it should return non-zero$/ do
	@command_exit_status.should_not == 0
end

Then /^mongo "(.*?)" works on "(.*?)"$/ do
	|version, server|

	# run the hello script in the mongo shell

	command_run [
		"vagrant", "ssh",
		server,
		"--command", [
			"/opt/mongodb-#{version}/bin/mongo",
			"/vagrant/test/hello.js",
		].shelljoin
	].shelljoin

	# check the output includes "hello world"

	@command_stdout.should include "hello world"

end


