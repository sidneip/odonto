# -*- encoding : utf-8 -*-
module ActiveModel
  # Returns the version of the currently loaded ActiveModel as a Gem::Version
  def self.version
    Gem::Version.new "4.0.0"
  end

  module VERSION #:nodoc:
    MAJOR, MINOR, TINY, PRE = ActiveModel.version.segments
    STRING = ActiveModel.version.to_s
  end
end
