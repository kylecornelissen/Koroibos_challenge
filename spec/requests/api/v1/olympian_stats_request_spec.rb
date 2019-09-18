require 'rails_helper'

describe "Olympians API" do
  it "sends a list of olympians" do
    @o1 = create(:olympian, name: 'Freshman', age: '24', weight: 176, sex: "M")
    @o2 = create(:olympian, name: 'Sophomore', age: '28', weight: 109, sex: "F")
    @o3 = create(:olympian, name: 'Junior', age: '33', weight: 158, sex: "M")
    @o4 = create(:olympian, name: 'Senior', age: '45', weight: 208, sex: "F")
    @olympians = Olympian.all

    get '/api/v1/olympian_stats'

    expect(response).to be_successful
    olympian_stats = JSON.parse(response.body)["data"]["attributes"]

    expect(olympian_stats.keys).to eq(["olympian_stats"])
    expect(olympian_stats["olympian_stats"].keys).to eq(["total_competiting_olympians", "average_weight", "average_age"])
    expect(olympian_stats["olympian_stats"]["average_weight"].keys).to eq(["unit", "male_olympians", "female_olympians"])
  end
end
