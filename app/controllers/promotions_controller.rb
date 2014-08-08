class PromotionsController < ApplicationController
  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)

    if @promotion.save
      redirect_to @promotion
    else
      render 'new'
    end
  end

  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def update

  end

private
  def promotion_params
    params.require(:promotion).permit(:client, :type)
  end
end


