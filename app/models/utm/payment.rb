module Utm
  setup_table = RCore::SequelDb.utm_db[:payment_transactions]
                               .select(:id, :account_id, :payment_incurrency, :currency_id, :currency_rate, :payment_absolute,
                                       :actual_date, :payment_enter_date, :payment_ext_number, :who_receive, :comments_for_user,
                                       :comments_for_admins, :burn_time, :is_canceled, :method)

  class Payment < ::Sequel::Model(setup_table)
    include WithinRange
    include ReadOnlyRecords

    def_column_alias :payment_method_id, :method
    within_range_attribute :payment_enter_date

    many_to_one :payment_method, key: :payment_method_id, class: Utm::PaymentMethod

    dataset_module do
      def by_user_account(account)
        where(account_id: account.id)
      end
    end
  end
end
