class Promotion < ActiveRecord::Base
  WEEKDAYS = %w(Mon Tue Wed Thu Fri Sat Sun)
  belongs_to :client
  before_save :output_params
  # TODO show validation error in view
  validates :description, :image, presence: true
  validate :start_date_cannot_be_before_today
  #  TODO find out why installation of imageMagick is not working
  has_attached_file :image #, :styles => {:medium => "300x300>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  # TODO Store WEEKDAYS as a 7 character string of 1's and 0's
  # TODO may should only WEEKSDAYS and not valid_days
  # TODO you should only be able to enter either week days or days not both
  # TODO  change validation to work with starts and ends

  def output_params
    puts('saving')
    puts(:description)
    puts(:valid_days)
  end


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
