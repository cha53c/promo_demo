class Cuisine < ActiveRecord::Base
  has_one :promotion

  validates_length_of :cuisine, maximum: 15
end