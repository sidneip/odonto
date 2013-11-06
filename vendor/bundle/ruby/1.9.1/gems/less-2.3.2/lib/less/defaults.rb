# -*- encoding : utf-8 -*-
module Less
  module Defaults

    def defaults
      @defaults ||= { :paths => [], :relativeUrls => true }
    end

    def paths
      defaults[:paths]
    end
    
  end
end
