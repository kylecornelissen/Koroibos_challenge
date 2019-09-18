require 'rails_helper'

describe "Medalists API" do
  it "sends a list of medalists their events" do
    @e1 = create(:event)
    @e2 = create(:event)
    @o1 = create(:olympian)
    @m1 = create(:medal, name: "NA")
    @m2 = create(:medal, name: "Gold")
    @m3 = create(:medal, name: "Silver")
    @oe1 = create(:olympian_event, event: @e1, medal: @m2, olympian: @o1)
    @oe2 = create(:olympian_event, event: @e1, medal: @m3, olympian: @o1)
    @olympian_events = [@oe1, @oe2]

    get "/api/v1/events/#{@e1.id}/medalists"
    expect(response).to be_successful

    attributes = JSON.parse(response.body)["data"]["attributes"]
    medalists = JSON.parse(response.body)["data"]["attributes"]["medalists"]

    expect(attributes.keys).to eq(["event", "medalists"])
    expect(medalists.first.keys).to eq(["name", "team", "age", "medal"])
  end
end
