module WithinRange
  extend ActiveSupport::Concern

  class_methods do
    def within_range_attribute(column)
      self.send(:define_singleton_method, :within_range) do |range|
        self.where(Sequel.lit("#{column} >= ?", range.start.to_i))
          .where(Sequel.lit("#{column} <= ?", range.stop.to_i))
      end
    end
  end
end
