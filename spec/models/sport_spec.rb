require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'relationships' do
    it { should have_many :events }
  end

  describe 'class methods' do
    it '.order_events' do
      e1 = create(:event, name: 'c')
      e2 = create(:event, name: 'a')
      e3 = create(:event, name: 'b')

      expect(events.order_events).to eq([e2,e3,e1])
    end
  end
end
