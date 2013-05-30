require "hq/cucumber/command"
require "hq/cucumber/temp-dir"

ENV["VAGRANT_DEFAULT_PROVIDER"] = "lxc"

$temp_dir_use_sudo = true

$project_dir = Dir.pwd
