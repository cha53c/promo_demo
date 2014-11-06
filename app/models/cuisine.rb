class Cuisine < ActiveRecord::Base
  has_one :promotion
  validates_uniqueness_of :cuisine
  validates_length_of :cuisine, maximum: 15
end