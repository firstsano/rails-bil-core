module Utm
  class Discount < ::Sequel::Model(RCore::SequelDb.utm_db[:discount_transactions_all])
    include ::WithinRange
    include ::ReadOnlyRecords
    include ::ActiveModel::Serialization

    within_range_attribute :discount_date

    many_to_one :service_data, key: :service_id, class: Utm::ServiceData

    dataset_module do
      def by_user_account(account)
        where(account_id: account.id)
      end
    end
  end
end
