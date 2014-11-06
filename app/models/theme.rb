class Theme < ActiveRecord::Base
 has_one :promotion
 validates_uniqueness_of :name
 validates_length_of :name, maximum: 15

end