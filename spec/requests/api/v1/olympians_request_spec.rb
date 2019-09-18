require 'rails_helper'

describe "Olympians API" do
  it "sends a list of olympians" do
    create_list(:olympian, 3)

    get '/api/v1/olympians'

    expect(response).to be_successful
    olympians = JSON.parse(response.body)["data"]

    expect(olympians.count).to eq(3)
    expect(olympians[0]["attributes"].keys).to include("name")
    expect(olympians[0]["attributes"].keys).to include("team")
    expect(olympians[0]["attributes"].keys).to include("age")
    expect(olympians[0]["attributes"].keys).to include("sport")
  end
end
