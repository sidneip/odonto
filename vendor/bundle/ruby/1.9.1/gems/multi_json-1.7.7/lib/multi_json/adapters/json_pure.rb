# -*- encoding : utf-8 -*-
require 'json/pure' unless defined?(::JSON)
require 'multi_json/adapters/json_common'

module MultiJson
  module Adapters
    # Use JSON pure to dump/load.
    class JsonPure < JsonCommon
      ParseError = ::JSON::ParserError
    end
  end
end
