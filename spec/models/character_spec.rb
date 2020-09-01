require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :house }
  end
end
