RSpec.shared_examples "readonly model" do
  it { is_expected.to be_readonly }
end
