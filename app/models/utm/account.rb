class Utm::Account < Sequel::Model(RCore::SequelDb.utm_db[:accounts])
  alias_attribute :internet_status, :int_status
end
