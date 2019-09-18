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
    expect(olympians[0]["attributes"].keys).to include("total_medals_won")
  end

  it "shows youngest olympian" do
    create(:olympian, name: 'one', age: 33)
    create(:olympian, name: 'two', age: 23)
    create(:olympian, name: 'three', age: 43)

    get '/api/v1/olympians?age=youngest'

    expect(response).to be_successful
    olympian = JSON.parse(response.body)["data"]["attributes"]

    expect(olympian["name"]).to eq("two")
    expect(olympian["age"]).to eq(23)
  end

  it "shows oldest olympian" do
    create(:olympian, name: 'one', age: 33)
    create(:olympian, name: 'two', age: 23)
    create(:olympian, name: 'three', age: 43)

    get '/api/v1/olympians?age=oldest'

    expect(response).to be_successful
    olympian = JSON.parse(response.body)["data"]["attributes"]

    expect(olympian["name"]).to eq("three")
    expect(olympian["age"]).to eq(43)
  end
end
