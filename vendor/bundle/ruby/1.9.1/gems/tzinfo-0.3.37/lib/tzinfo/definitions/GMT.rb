# -*- encoding : utf-8 -*-
module TZInfo
  module Definitions
    module GMT
      include TimezoneDefinition
      
      linked_timezone 'GMT', 'Etc/GMT'
    end
  end
end
