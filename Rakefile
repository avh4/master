require "rubygems"
require "rake"

Dir['tasks/**/*.rake'].each { |rake| load rake }

task :start => 'staticmatic:preview'
task :build => 'staticmatic:build'