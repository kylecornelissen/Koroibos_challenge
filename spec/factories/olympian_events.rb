FactoryBot.define do
  factory :olympian_event do
    olympian { create(:olympian) }
    event { create(:event) }
    medal { create(:medal) }
  end
end
