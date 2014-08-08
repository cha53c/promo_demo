class Promotion < ActiveRecord::Base
  validates :client, presence: true
  validates :type, presence: true
end
