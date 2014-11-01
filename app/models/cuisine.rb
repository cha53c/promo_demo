class Cuisine < ActiveRecord::Base
  validates_length_of :cuisine, maximum: 15
end