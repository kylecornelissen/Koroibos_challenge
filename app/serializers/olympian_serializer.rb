class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :team, :age, :sport
end
