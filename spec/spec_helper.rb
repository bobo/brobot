require 'rubygems'
require 'bundler/setup'

require 'cinch/plugins/Wolfram' # and any other gems you need
require 'vcr'
RSpec.configure do |config|
 
VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end
  # some (optional) config here
end