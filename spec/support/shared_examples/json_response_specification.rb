RSpec.shared_context "json API response context" do
  let(:body) { response.body }
end

RSpec.shared_examples 'basic json API response' do |should_have_items:, required_attributes: nil|
  include_context "json API response context"

  it "should return corresponding data in response" do
    expect(response).to have_http_status(:ok)
  end

  it "should have resources with proper attributes" do
    expect(body).to match_json_expression JsonPattern.collection(items: should_have_items,
      attributes: required_attributes)
  end
end

RSpec.shared_examples 'json API response with relationships' do |type|
  include_context "json API response context"
  it "should have resources with relationships attribute set" do
    expect(body).to match_json_expression JsonPattern.relationships(type)
  end
end

RSpec.shared_examples 'json API response with included' do |type|
  include_context "json API response context"
  it "should have 'included' attribute with proper types" do
    expect(body).to match_json_expression JsonPattern.inclusion(type)
  end
end
