require 'rails_helper'

describe "Events API" do
  it "sends a list of sports and their events" do
    @s1 = create(:sport, name: 'basketball')
    @s2 = create(:sport, name: 'football')
    @s3 = create(:sport, name: 'hockey')
    @e1 = create(:event, name: '2v2', sport: @s1)
    @e2 = create(:event, name: '5v5', sport: @s1)
    @e3 = create(:event, name: 'flag', sport: @s2)
    @e4 = create(:event, name: 'ice', sport: @s3)
    @e5 = create(:event, name: 'street', sport: @s3)

    get '/api/v1/events'

    expect(response).to be_successful
    events = JSON.parse(response.body)["events"]["data"]
    event = JSON.parse(response.body)["events"]["data"].first["attributes"]

    expect(events.count).to eq(3)
    expect(event.keys).to eq(["name", "events"])
    expect(event["events"]).to eq(["2v2", "5v5"])
  end
end
