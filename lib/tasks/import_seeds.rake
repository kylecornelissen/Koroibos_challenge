require 'csv'

namespace :import do
  desc "import olympian data from CSV files"

  task seed: :environment do
    CSV.foreach('./data/olympian_data.csv', headers: true) do |row|
      row = row.to_h
      olympian = Olympian.find_or_create_by!(name: row["Name"],
                                             team: row["Team"],
                                             age: row["Age"],
                                             sport: row["Sport"],
                                             weight: row["Weight"],
                                             sex: row["Sex"])
      sport = Sport.find_or_create_by!(name: row["Sport"] )
      event = Event.find_or_create_by!(name: row["Event"],
                                       sport: sport)
      medal = Medal.find_or_create_by!(name: row["Medal"])
      olympian_event = OlympianEvent.find_or_create_by!(olympian: olympian,
                                                        event: event,
                                                        medal: medal)
    end
  end
end
