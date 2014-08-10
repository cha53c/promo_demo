class Promotion < ActiveRecord::Base
  belongs_to :client
  validates :type, presence: true
end
