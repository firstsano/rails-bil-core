module ReadOnlyRecords
  extend ActiveSupport::Concern

  def readonly?
    true
  end

  def before_save
    return false if readonly?
    super
  end

  def before_destroy
    return false if readonly?
    super
  end
end
