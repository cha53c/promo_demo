module PromotionsHelper

  def day_on_off day
    if day
      "day-on"
    else
      "day-off"
    end
  end
end
