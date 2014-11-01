class Client < ActiveRecord::Base
  has_many :promotions, dependent: :destroy
  validates :photo, :tel, :website, :email, :name, presence: true
  has_attached_file :photo, :styles => {:medium => "400x400>", :small => "200x200>"}
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  validates_attachment_size :photo, less_than: 1.megabyte
  validates_length_of :name, maximum: 20
  validates_length_of :email, maximum: 50
  validates_length_of :website, maximum: 50
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
