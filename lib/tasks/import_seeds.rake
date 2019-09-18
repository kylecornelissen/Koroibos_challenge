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
    end
  end
end
