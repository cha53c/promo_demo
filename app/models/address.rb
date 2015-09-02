class Address < ActiveRecord::Base
  belongs_to :client

  # validates :line1, :country, presence: true
end
