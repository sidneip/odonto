# -*- encoding : utf-8 -*-
require 'rails/generators/erb/controller/controller_generator'

module Erb # :nodoc:
  module Generators # :nodoc:
    class MailerGenerator < ControllerGenerator # :nodoc:
      protected

      def format
        :text
      end
    end
  end
end
