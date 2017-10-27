RSpec.shared_context "json API response context" do
  let(:body) { response.body }
end

RSpec.shared_examples 'basic json API response' do |should_have_items:, required_attributes: nil, with_relationships: nil|
  include_context "json API response context"

  it "should return corresponding data in response" do
    expect(response).to have_http_status(:ok)
  end

  it "should have resources with proper attributes" do
    attributes = JsonPattern.resource required_attributes
    attributes.merge! JsonPattern.relationships(with_relationships) if with_relationships
    expect(body).to match_json_expression JsonPattern.collection(should_have_items, attributes)
  end
end

RSpec.shared_examples 'json API response with included' do |type:, required_attributes:|
  include_context "json API response context"
  it "should have 'included' attribute with proper types" do
    expect(body).to match_json_expression JsonPattern.inclusion(type, required_attributes)
  end
end
