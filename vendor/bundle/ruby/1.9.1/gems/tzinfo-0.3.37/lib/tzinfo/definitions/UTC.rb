# -*- encoding : utf-8 -*-
module TZInfo
  module Definitions
    module UTC
      include TimezoneDefinition
      
      linked_timezone 'UTC', 'Etc/UTC'
    end
  end
end
