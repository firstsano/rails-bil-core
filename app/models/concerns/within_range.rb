module WithinRange
  extend ActiveSupport::Concern

  class_methods do
    def within_range_attribute(column)
      send(:define_singleton_method, :within_range) do |range|
        where(Sequel.lit("#{column} >= ?", range.start.to_i))
          .where(Sequel.lit("#{column} <= ?", range.stop.to_i))
      end
    end
  end
end
