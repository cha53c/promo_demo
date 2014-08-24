class Promotion < ActiveRecord::Base
  belongs_to :client
  validates :promo_type, presence: true
  validate :start_date_cannot_be_before_today
  has_attached_file :image #, :styles => {:medium => "300x300>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }




  def start_date_cannot_be_before_today
   if start_date.present?
     sd = Date.strptime(start_date, '%d-%m-%Y')
     if sd < Date.today
       errors.add(:start_date, 'start date cannot be in the past')
     end
   end
  end
  def end_date_cannot_be_before_start_date

  end
end
