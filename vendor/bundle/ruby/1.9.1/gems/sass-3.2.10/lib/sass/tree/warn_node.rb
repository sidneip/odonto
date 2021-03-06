# -*- encoding : utf-8 -*-
module Sass
  module Tree
    # A dynamic node representing a Sass `@warn` statement.
    #
    # @see Sass::Tree
    class WarnNode < Node
      # The expression to print.
      # @return [Script::Node]
      attr_accessor :expr

      # @param expr [Script::Node] The expression to print
      def initialize(expr)
        @expr = expr
        super()
      end
    end
  end
end
