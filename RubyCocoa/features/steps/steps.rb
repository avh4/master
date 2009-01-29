require 'spec'
require 'osx/cocoa'

# Load the app files-- copied from rb_main.rb
path = File.dirname(__FILE__) + "/../.."
rbfiles = Dir.entries(path).select {|x| /\.rb\z/ =~ x}
rbfiles -= [ File.basename(__FILE__) ]
rbfiles.each do |path|
  require( File.basename(path) )
end

Given /^a given$/ do
  @var = nil
end

When /^a when$/ do
  @var = AppDelegate.new
end

Then /^the then$/ do
  @var.should_not be_nil
end
