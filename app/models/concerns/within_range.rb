module WithinRange
  extend ActiveSupport::Concern

  class_methods do
    def within_range_attribute(column)
      self.send(:define_singleton_method, :within_range) do |range|
        self.where("#{column} >= ?", range.start.to_i)
          .where("#{column} <= ?", range.stop.to_i)
      end
    end
  end
end
