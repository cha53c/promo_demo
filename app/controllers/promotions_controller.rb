class PromotionsController < ApplicationController
  def new
    @promotion = Promotion.new
    @client = Client.find(params[:client_id])
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
    @client = Client.find(@promotion.client_id)
  end

  def edit
    @promotion = Promotion.find(params[:id])
    @client = Client.find(params[:client_id])
  end

  def update
    # TODO why is this updating the wrong record
    @promotion = Promotion.find(params[:id])
    @client = Client.find(params[:client_id])
    if @promotion.update(promotion_params)
      render 'edit'
    else
      render 'error'
    end
  end

private
  def promotion_params
    # TODO remove start_date and end_date from db
    # TODO remove valid_days
    params.require(:promotion).permit(:promo_type, :image, :details,
                                      :description, :active, :from, :to,:starts , :ends,
                                      :mon, :tue, :wed, :thu, :fri, :sat, :sun)

  end

end


