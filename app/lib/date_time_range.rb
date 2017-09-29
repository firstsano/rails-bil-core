class DateTimeRange
  include Enumerable

  attr_reader :range, :start, :stop

  def initialize(start:, stop:)
    @start = start
    @stop = stop
    @range = @start..@stop
  end

  def self.generate_month(date)
    new start: date.beginning_of_month, stop: date.end_of_month
  end

  def self.generate(start:, stop: nil)
    return generate_month(start) unless stop
    new start: start, stop: stop
  end
end
