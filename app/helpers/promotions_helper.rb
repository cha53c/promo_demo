module PromotionsHelper

  def day_on_off day
    if day
      "day-on day_label"
    else
      "day-off day_label"
    end
  end
end
