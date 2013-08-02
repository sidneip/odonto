module ApplicationHelper
  def formata_data(data)
  	data.try(:strftime, "%m/%d/%Y")
  end
end
