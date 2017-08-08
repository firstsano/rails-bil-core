class DateTimeRange
  include Enumerable

  attr_reader :range, :start, :stop

  def initialize(start:, stop:)
    @start, @stop = [start, stop]
    @range = @start..@stop
  end

  def self.generate_month(date)
    self.new start: date.beginning_of_month, stop: date.end_of_month
  end

  def self.generate(start: , stop: nil)
    return generate_month(start) unless stop
    self.new start: start, stop: stop
  end
end
