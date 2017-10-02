module ReadOnlyRecords
  extend ActiveSupport::Concern

  def readonly?
    true unless Rails.env.test?
  end

  def before_save
    cancel_action if readonly?
    super
  end

  def before_destroy
    cancel_action if readonly?
    super
  end
end
