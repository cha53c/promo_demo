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
  has_attached_file :image, :styles => {:medium => "300x200>", :small => "150x150>"}
  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png"]}
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
    # TODO adapt to use stings passed in and date range
    puts date_param
    if (date_param=='today')
      s_date = Date.today
      e_date = s_date
    elsif (date_param=='tomorrow')
      s_date = Date.tomorrow
      e_date = s_date
    elsif (date_param=="this_week")
      # promotions for this week will start from today (there is not point in showing offers you cannot use)
      # and run up to and including saturday
      # at least one of the remaining days between today and saturday inclusive will be set to true
      # TODO
      return []
    elsif (date_param=='this_weekend')
      #   sa su, should this include Friday
      #   TODO
      return []
    end

    day = wday_string(s_date)
    # TODO how to build a query for an variable number of days??
    query = "starts <= ? AND ends >= ? AND " + day + " = ?"
    Promotion.where(query, s_date, e_date, true)
  end


  def self.find_promotion_text(params_text)
    # TODO  avoid sql injection
    # TODO does not seem to return an array
    Promotion.where("lower(description) LIKE ? OR lower(promo_type) LIKE ?", params_text, params_text)
  end

  # maps date wday to the day field used in the db
  private
  def self.wday_string (date)
    wdays = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
    wdays[date.wday]
  end

end
