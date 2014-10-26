$:.unshift(File.expand_path('../lib', File.dirname(__FILE__)))

require 'david'

module David
  module TestHelper
    def debug
      @debug ||= ENV['DEBUG'].nil? ? 'none' : 'debug'
    end

    def random_port
      rand((2**10+1)..(2**16-1))
    end

    def supervised_server(options)
      defaults = {
        :Host => '::1',
        :Port => CoAP::PORT,
        :Log => 'none'
      }

      app = options.delete(:app) || Rack::HelloWorld

      David::Server.supervise_as(:david, app, defaults.merge(options))
    end
  end
end

include David
include David::TestHelper
