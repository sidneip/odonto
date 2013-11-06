# -*- encoding : utf-8 -*-
#!/usr/bin/env ruby
def triangle(n) 
  (0..n).inject do |sum, i| 
    sum +=i 
  end
end
puts triangle(3)

