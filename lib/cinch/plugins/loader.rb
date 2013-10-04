require 'usagewatch'
require 'cinch'
module Cinch
  module Plugins
		class Loader
		  include Cinch::Plugin
		  match /brobot: (load?)/, :use_prefix => false
		  
		  def execute(m, query)
		    usw = Usagewatch
		    m.reply(usw.uw_load)   
		  end
		end
	end
end