require 'rails_helper'

RSpec.describe OlympianEvent, type: :model do
  describe 'relationships' do
    it { should belong_to :olympian }
    it { should belong_to :event }
    it { should belong_to :medal }
  end
end
