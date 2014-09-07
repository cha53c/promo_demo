class Client < ActiveRecord::Base
  has_many :promotions, dependent: :destroy
  has_attached_file :photo, :styles => {:medium => "400x400>", :small => "200x200>"}
  validates :photo, :tel, :website, :email, presence: true
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  # this will map to promotion
  # validates :name, presence: true, length: {minimum:  1}
  # TODO include validations
  # TODO include default values
end
