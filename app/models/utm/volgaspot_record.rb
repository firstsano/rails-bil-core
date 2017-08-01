class Utm::VolgaspotRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection VOLGASPOT_DB

  def readonly?
    true
  end
end
