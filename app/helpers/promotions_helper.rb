module PromotionsHelper

  def day_on_off day
    if day
      "label label-success label-as-badge"
    else
      "label label-default label-as-badge"
    end
  end
end
