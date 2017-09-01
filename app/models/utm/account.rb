class Utm::Account < Sequel::Model(RCore::SequelDb.utm_db[:accounts])
  include ReadOnlyRecords

  alias_attribute :internet_status, :int_status
end
