class Promotion < ActiveRecord::Base
  belongs_to :client
  # TODO show validation error in view
  # TODO validate that a least one day of the week has been populated
  validates :description, :image, presence: true, on: :create
  validate :start_date_cannot_be_before_today
  #  TODO find out why installation of imageMagick is not working
  has_attached_file :image , :styles => {:medium => "300x200#", :small => "150x150>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  # TODO  change validation to work with starts and ends

  def start_date_cannot_be_before_today
   if start_date.present?
     sd = Date.strptime(start_date, '%d-%m-%Y')
     if sd < Date.today
       errors.add(:start_date, 'start date cannot be in the past')
     end
   end
  end
  def end_date_cannot_be_before_start_date
  # TODO
  end
end
