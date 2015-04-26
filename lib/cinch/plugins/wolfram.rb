require 'cinch'
require 'wolfram-alpha'
module Cinch
  module Plugins
    class Wolfram
      include Cinch::Plugin
      match /^w: (.+)/, :use_prefix => false
      self.prefix = /^w:/




      def query(query)
        @wolfram.query(query)
      end

      def search(query)

        @wolfram = WolframAlpha::Client.new(api_id, options = { :timeout => 1 } )
        response = query(query)
        result = parse_response response
        if result
          result
        else
          "Sorry, I've no idea"
        end
      end

      def parse_response(response)
        pod = response.find { |pod| pod.title == "Result" }
        if pod.nil?
          pod = response.pods[1]
        end
        pod.subpods[0].plaintext
      end

      def execute(m, query)
        m.reply search(query), true
      end


      private
      def api_id
        config[:api_id]
      end
    end
  end
end
