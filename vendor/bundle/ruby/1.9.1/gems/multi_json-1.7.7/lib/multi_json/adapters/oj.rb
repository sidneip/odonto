# -*- encoding : utf-8 -*-
require 'oj' unless defined?(::Oj)
require 'multi_json/adapter'

module MultiJson
  module Adapters
    # Use the Oj library to dump/load.
    class Oj < Adapter
      defaults :load, :mode => :strict, :symbolize_keys => false
      defaults :dump, :mode => :compat, :time_format => :ruby

      ParseError = defined?(::Oj::ParseError) ? ::Oj::ParseError : SyntaxError

      def load(string, options={})
        options[:symbol_keys] = options.delete(:symbolize_keys)
        ::Oj.load(string, options)
      end

      def dump(object, options={})
        options.merge!(:indent => 2) if options[:pretty]
        ::Oj.dump(object, options)
      end
    end
  end
end
