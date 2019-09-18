FactoryBot.define do
  factory :event do
    name { "OlympianEvent" }
    sport { create(:sport) }
  end
end
