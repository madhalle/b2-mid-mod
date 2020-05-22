require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :creation_year }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should have_many :actors }
    it { should belong_to :studio }
  end
end
