class Metric < Sequel::Model
  many_to_one :user
  one_to_many :points
end
