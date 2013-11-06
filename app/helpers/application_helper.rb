# -*- encoding : utf-8 -*-
module ApplicationHelper
  def formata_data(data)
  	data.try(:strftime, "%d/%m/%Y")
  end
end
