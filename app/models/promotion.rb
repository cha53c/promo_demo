class Promotion < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :client
  belongs_to :cuisine
  belongs_to :theme

  # attr_accessor( :cuisine_id)

  # TODO set accessible attributes
  # description is the similar to Ts&Cs.
  # TODO details, how long should the visible part be and how long over all??
  validates :description, :image, presence: true, on: :create
  validates :promo_type, :details, :starts, :ends, presence: true
  has_attached_file :image, styles: {medium: "300x200>", small: "150x150>"}
  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png"]}
  validates_attachment_size :image, less_than: 1.megabyte
  validates_with AtLeastOneActivePromotionDay
  validates_with StartDateCannotBeBeforeToday, on: :create
  validates_with EndDateCannotBeBeforeStartDate

  validates :promo_type, length: 3..20
  validates_length_of :description, maximum: 50
  validates_length_of :details, maximum: 120


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

  def self.find_by_cuisine(params_cuisine)
    c = Cuisine.find_by_cuisine(params_cuisine)
    Promotion.joins(:cuisine).where(cuisine: c.id)
  end

  def self.find_by_theme(params_cuisine)
    t = Theme.find_by_name(params_cuisine)
    Promotion.joins(:theme).where(theme: t.id)
  end

  # maps date wday to the day field used in the db
  private
  def self.wday_string (date)
    wdays = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
    wdays[date.wday]
  end
end
