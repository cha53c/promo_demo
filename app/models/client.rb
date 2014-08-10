class Client < ActiveRecord::Base
  has_many :promotions
  # this will map to promotion
  # validates :name, presence: true, length: {minimum:  1}
  # TODO include validations
  # TODO include default values
end
