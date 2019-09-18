require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'relationships' do

  end

  describe 'class methods' do
    before :each do
      @o1 = create(:olympian, name: 'Freshman', age: '24')
      @o1 = create(:olympian, name: 'Junior', age: '33')
      @o1 = create(:olympian, name: 'Senior', age: '45')
    end

    it '.age_sorter' do
      youngest_olympian = Olympian.age_sorter("youngest")
      oldest_olympian = Olympian.age_sorter("oldest")

      expect(youngest_olympian[:name]).to eq('Freshman')
      expect(oldest_olympian[:name]).to eq('Senior')
    end
  end
end
