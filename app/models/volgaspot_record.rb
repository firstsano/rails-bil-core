class VolgaspotRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection VOLGASPOT_DB
end
