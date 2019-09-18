require 'rails_helper'

RSpec.describe Medal, type: :model do
  describe 'relationships' do
    it { should have_many :olympian_events }
    it { should have_many(:olympians).through(:olympian_events) }
    it { should have_many(:events).through(:olympian_events) }
  end
end
