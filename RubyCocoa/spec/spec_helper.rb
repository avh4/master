require 'spec'
require 'osx/cocoa'

# Load the app files-- copied from rb_main.rb
path = File.dirname(__FILE__) + "/.."
rbfiles = Dir.entries(path).select {|x| /\.rb\z/ =~ x}
rbfiles -= [ File.basename(__FILE__) ]
rbfiles.each do |path|
  require( File.basename(path) )
end

# This method is used to prevent warnings on lines like this
#    some_number.should == 7
# Instead, use
#    check some_number.should == 7
#
# See http://rubyforge.org/tracker/?func=detail&atid=3149&aid=7101&group_id=797
def check(*args)
end