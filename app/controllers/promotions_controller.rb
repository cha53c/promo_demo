class PromotionsController < ApplicationController
  def new
  end

  def create
    @client = Client.find(params[:client_id])
    @promotion = @client.promotions.create(promotion_params)
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
    @promotion = Promotion.find(params[:id])
    @client = Client.find(params[:client_id])
    if @promotion.update(promotion_params)
      flash[:notice] = "Successfully updated promotion"
      render 'edit'
    else
      flash[:notice] = "promotion update failed"
      render 'edit'
    end
  end

private
  def promotion_params

    params.require(:promotion).permit(:promo_type, :image, :details,
                                      :description, :active, :from, :to,:starts , :ends,
                                      :mon, :tue, :wed, :thu, :fri, :sat, :sun)

  end

end


