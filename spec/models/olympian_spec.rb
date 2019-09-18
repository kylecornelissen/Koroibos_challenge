require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'relationships' do
    it { should have_many :olympian_events }
    it { should have_many(:events).through(:olympian_events) }
    it { should have_many(:medals).through(:olympian_events) }
  end

  describe 'instance methods' do
    before :each do
      @o1 = create(:olympian, name: 'Freshman', age: '24', weight: 176, sex: "M")
      @o2 = create(:olympian, name: 'Sophomore', age: '28', weight: 109, sex: "F")
      @o3 = create(:olympian, name: 'Junior', age: '33', weight: 158, sex: "M")
      @o4 = create(:olympian, name: 'Senior', age: '45', weight: 208, sex: "F")
      @olympians = Olympian.all
    end

    it '.olympian_stats' do
      hash_result = { "average_age" => 32.5,
                      "average_weight" => {
                        "female_olympians"=>158.5,
                        "male_olympians"=>167.0,
                        "unit"=>"kg"
                      },
                      "total_competiting_olympians"=>4
                    }

      expect(@o1.olympian_stats).to eq(hash_result)
    end
  end


  describe 'class methods' do
    before :each do
      @o1 = create(:olympian, name: 'Freshman', age: '24', weight: 176, sex: "M")
      @o2 = create(:olympian, name: 'Junior', age: '33', weight: 158, sex: "M")
      @o3 = create(:olympian, name: 'Senior', age: '45', weight: 208, sex: "F")
      @olympians = Olympian.all
    end

    it '.age_sorter' do
      youngest_olympian = @olympians.age_sorter("youngest")
      oldest_olympian = @olympians.age_sorter("oldest")

      expect(youngest_olympian[:name]).to eq('Freshman')
      expect(oldest_olympian[:name]).to eq('Senior')
    end

    it '.average_weight' do
      o4 = create(:olympian, name: 'Sophomore', age: '28', weight: 109, sex: "F")
      expect(@olympians.average_weight("M")).to eq(167)
      expect(@olympians.average_weight("F")).to eq(158.5)
    end
  end
end
