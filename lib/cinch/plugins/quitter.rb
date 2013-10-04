require 'cinch'
module Cinch
  module Plugins
		class Quitter
		  include Cinch::Plugin
		  match /brobot: (qqq)/, :use_prefix => false
		  		  
		  def execute(m, query)
		    bot.quit("bye")
		  end
		end
	end
end