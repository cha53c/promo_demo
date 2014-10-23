class Promotion < ActiveRecord::Base
  belongs_to :client
  # TODO set accessable atrribrutes
  # TODO show validation error in view
  # TODO validate that a least one day of the week has been populated
  # TODO validate field lengths
  # TODO remove start_date and end_date from db
  # TODO remove valid_days
  validates :description, :image, presence: true, on: :create
  validate :start_date_cannot_be_before_today
  has_attached_file :image , :styles => {:medium => "300x200>", :small => "150x150>"}
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
      #TODO
  end
  # builds search query based on the specified date or date type
  # i.e. today, tomorrow
  def self.find_by_date(date_param)
    # TODO adapt you use stings passed in and date range
    date = Date.today
    day = wday_string(date)
    query = "starts <= ? AND " + day + " = ?"
    Promotion.where(query, date, true)
  end

  def self.find_promotion_text(params_text)
    # TODO  avoid sql injection
    # param_keyword = "%#{params[:keyword].downcase}%"
    # TODO does not seem to return an array
    Promotion.where("lower(description) LIKE ? OR lower(promo_type) LIKE ?", params_text, params_text)
  end

  # maps date wday to the day field used in the db
  private
  def self.wday_string (date)
    wdays = ['sun','mon','tue','wed','thu','fri','sat']
    wdays[date.wday]
  end
end
