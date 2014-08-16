class PromotionsController < ApplicationController
  def new
    @promotion = Promotion.new
  end

  def create
    @client = Client.find(params[:client_id])
    @promotion = @client.promotions.create(promotion_params)
    @promotion = Promotion.new(promotion_params)
    redirect_to client_path(@client)
  end

  def destroy
    @client = Client.find(params[:client_id])
    @promotion = @client.promotions.find(params[:id])
    @promotion.destroy
    redirect_to client_path(@client)
  end

  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def edit
    @promotion = Promotion.find(params[:id])
  end

  def update

  end

private
  def promotion_params
    params.require(:promotion).permit(:promo_type, :start_date, :end_date)
  end
end


