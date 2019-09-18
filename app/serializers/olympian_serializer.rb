class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :team, :age, :sport

  attribute :total_medals_won do |olympian|
    olympian.total_medals_won
  end
end
