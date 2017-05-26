require 'rails_helper'

RSpec.describe 'User', type: :model do
  context 'using ActiveResource as user model' do
    it 'should inherit from ActiveResource class' do
      expect(User).to be <  ActiveResource::Base
    end
  end
end
