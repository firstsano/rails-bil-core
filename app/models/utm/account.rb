class Utm::Account < Utm::VolgaspotRecord
  self.table_name = "accounts"

  alias_attribute :internet_status, :int_status
end
