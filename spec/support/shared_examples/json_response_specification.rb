RSpec.shared_examples 'basic json API response' do |
  should_have_items: false,
  required_attributes: false
|

  let(:string_response) { response.body }
  let(:hash_response) { json_response["data"] }

  it "should return corresponding data in response" do
    expect(response).to have_http_status(:ok)
  end

  it "has array-type 'data' property", aggregate_failures: true do
    expect(string_response).to have_json_path "data"
    expect(string_response).to have_json_type(Array).at_path "data"
  end

  it "should have resources with proper attributes" do
    hash_response.each do |resource|
      expect(resource.to_json).to have_json_path "id"
      expect(resource.to_json).to have_json_path "type"
      expect(resource.to_json).to have_json_path "attributes"
    end
  end

  if should_have_items
    it "has #{should_have_items} number of resource items" do
      expect(string_response).to have_json_size(should_have_items).at_path "data"
    end
  end

  if required_attributes
    it "has every resource with preset attributes" do
      hash_response.each do |resource|
        resource["attributes"].each do |attribute, value|
          expect(required_attributes).to include attribute
        end
      end
    end
  end
end

RSpec.shared_examples 'json API response with relationships' do |with_relationships|
  let(:string_response) { response.body }
  let(:hash_response) { json_response["data"] }

  it "should have resources with relationships attribute set" do
    hash_response.each do |resource|
      expect(resource.to_json).to have_json_path "relationships"
    end
  end

  it "should have proper relationship resource type" do
    hash_response.each do |resource|
      expect(resource["relationships"].to_json).to have_json_path with_relationships
    end
  end
end

RSpec.shared_examples 'json API response with included' do
  let(:string_response) { response.body }
  let(:hash_response) { json_response["data"] }

  it "should have 'included' attribute in route path" do
    expect(string_response).to have_json_path "included"
  end
end
