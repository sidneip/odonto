# -*- encoding : utf-8 -*-
module ActiveRecord
  # Returns the version of the currently loaded ActiveRecord as a Gem::Version
  def self.version
    Gem::Version.new "4.0.0"
  end

  module VERSION #:nodoc:
    MAJOR, MINOR, TINY, PRE = ActiveRecord.version.segments
    STRING = ActiveRecord.version.to_s
  end
end
