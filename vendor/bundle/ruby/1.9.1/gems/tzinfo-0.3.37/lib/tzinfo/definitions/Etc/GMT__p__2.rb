# -*- encoding : utf-8 -*-
module TZInfo
  module Definitions
    module Etc
      module GMT__p__2
        include TimezoneDefinition
        
        timezone 'Etc/GMT+2' do |tz|
          tz.offset :o0, -7200, 0, :'GMT+2'
          
        end
      end
    end
  end
end