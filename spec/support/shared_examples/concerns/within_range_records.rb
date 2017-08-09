RSpec.shared_examples "model with within_range method" do |attribute|
  subject { described_class }
  let(:key) { attribute.to_sym }
  let(:factory_name) { subject.name.demodulize.downcase.to_sym }
  let(:timestamp_range) do
    start, stop = "01-01-2007".to_date, "01-02-2007".to_date
    (start..stop).to_a.map(&:to_datetime).map(&:to_i)
  end
  let(:range) do
    DateTimeRange.generate start: "10-01-2007".to_datetime,
      stop: "15-01-2007".to_datetime
  end

  it { is_expected.to respond_to(:within_range).with(1).arguments }

  it "should return only records within range", aggregate_failures: true do
    timestamp_range.each { |time| create factory_name, key => time }
    within_range_records = described_class.within_range range
    expect(within_range_records.count).to eq 6
    expect(within_range_records).to all(have_attributes(key => be >= range.start.to_i ))
    expect(within_range_records).to all(have_attributes(key => be <= range.stop.to_i ))
  end

  clean
end
