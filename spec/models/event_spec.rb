require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many(:olympians).through(:olympian_events) }
    it { should have_many(:medals).through(:olympian_events) }
  end

  describe 'instance methods' do
    before :each do
      @e1 = create(:event)
      @e2 = create(:event)
      @o1 = create(:olympian)
      @m1 = create(:medal, name: "NA")
      @m2 = create(:medal, name: "Gold")
      @m3 = create(:medal, name: "Silver")
      @oe1 = create(:olympian_event, event: @e1, medal: @m2, olympian: @o1)
      @oe2 = create(:olympian_event, event: @e1, medal: @m3, olympian: @o1)
      @olympian_events = [@oe1, @oe2]

      @result = [
        { :age=>@o1.age,
          :medal=>@m2.name,
          :name=>@o1.name,
          :team=>@o1.team
        },
        { :age=>@o1.age,
          :medal=>@m3.name,
          :name=>@o1.name,
          :team=>@o1.team
        }
      ]
    end

    it '.medalist_info' do
      expect(@e1.medalist_info).to eq(@result)
    end

    it '.medalist_list' do
      expect(@e1.medalist_list(@olympian_events)).to eq(@result)
    end

    it '.create_medalist_hash' do
      hash_result = {:age=>@o1.age, :medal=>@m2.name, :name=>@o1.name, :team=>@o1.team}
      expect(@e1.create_medalist_hash(@m2, @o1)).to eq(hash_result)
    end
  end
end
