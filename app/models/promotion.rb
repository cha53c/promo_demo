class Promotion < ActiveRecord::Base
  belongs_to :client
  validates :promo_type, :start_date, :end_date, presence: true
  validate :start_date_cannot_be_before_today




  def start_date_cannot_be_before_today
    sd = Date.strptime(start_date, '%d-%m-%Y')
   if sd < Date.today
     errors.add(:start_date, 'start date cannot be in the past')
   end
  end
  def end_date_cannot_be_before_start_date

  end
end
