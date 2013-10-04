require 'cinch'
require 'cinch/plugins/title'
require_relative 'cinch/plugins/wolfram'
require_relative 'cinch/plugins/loader'
require_relative 'cinch/plugins/quitter'
require 'yaml'

config = YAML::load(File.open('config.yml'))

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "brobot"
    c.server = "irc.quakenet.org"
    c.channels = config["channels"]
    c.plugins.plugins = [Cinch::Plugins::Loader,Cinch::Plugins::Quitter, Cinch::Plugins::Wolfram, Cinch::Plugins::Title]
    c.plugins.options = {
      Cinch::Plugins::Title => {
        "ignore" => [
          "facebook.com"
        ]
      },
      Cinch::Plugins::Wolfram => {
        :api_id => config["wolfram_api"]
      }
    }
  end
end
bot.loggers.level = :debug
bot.start