require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'relationships' do
    it { should have_many :events }
  end

  describe 'class methods' do
    it '.order_events' do
      e1 = create(:sport, name: 'c')
      e2 = create(:sport, name: 'a')
      e3 = create(:sport, name: 'b')
      sports = Sport.all

      expect(sports.order_events).to eq([e2,e3,e1])
    end
  end
end
