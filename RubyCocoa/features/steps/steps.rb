require 'spec'
require 'osx/cocoa'
OSX.require_framework File.expand_path(File.dirname(__FILE__) + '/../../GoogleToolboxForMac.framework')

# Load the app files-- copied from rb_main.rb
path = File.dirname(__FILE__) + "/../.."
rbfiles = Dir.entries(path).select {|x| /\.rb\z/ =~ x}
rbfiles -= [ File.basename(__FILE__) ]
rbfiles.each do |path|
  require( File.basename(path) )
end

def loadNibWithOwner(file, owner)
  file = "English.lproj/#{file}.nib"
  nib = OSX::NSNib.alloc.initWithContentsOfURL(OSX::NSURL.URLWithString(file))
  fail "Could not load the NIB file '#{file}'" if nib == nil
  bool = nib.instantiateNibWithOwner_topLevelObjects(owner, nil)
  fail "#{file}: NIB file failed to instantiate" if !bool
end

def approveWindow(window, name)  
  OSX::GTMRenderer.isImageOfObject_matches(@window.contentView.superview, name).should == 1
end

Given /^a given$/ do
  @window = nil
end

When /^the main window is shown$/ do
  @app = OSX::NSApplication.sharedApplication
  loadNibWithOwner("MainMenu", @app)
  @window = @app.windows[0]
  @window.should_not be_nil
end

Then /^the window will be empty$/ do
  # When the scenario is run, it will create a file "~/Desktop/Then example.*.tiff"
  # Move this file to the approvals/ folder to approve the image.
  approveWindow(@window, "the window will be empty")
end
