class PromotionsController < ApplicationController
  after_action :verify_authorized, except: [:index, :show]

  def new
    @promotion = Promotion.new
    authorize @promotion
  end

  def create
    @client = Client.find(params[:client_id])
    @promotion = @client.promotions.create(promotion_params)
    authorize @promotion
    unless @promotion.id
      logger.info("promotion was not created")
      flash.now.alert = "Failed to add new promotion"
      render 'new'
    else
      redirect_to({ action: "edit", id: @promotion.id }, notice: "Successfully added new promotion")
    end
  end

  def destroy
    @client = Client.find(params[:client_id])
    @promotion = @client.promotions.find(params[:id])
    authorize @promotion
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
    flash.clear
    @promotion = Promotion.find(params[:id])
    @client = Client.find(params[:client_id])
    authorize @promotion
  end

  def update
    @promotion = Promotion.find(params[:id])
    authorize @promotion
    @client = Client.find(params[:client_id])
    if @promotion.update(promotion_params)
      flash.now.notice = "Successfully updated promotion"
      render 'edit'
    else
      flash.now.alert = "promotion update failed"
      render 'edit'
    end
  end

  private
  def promotion_params
    params.require(:promotion).permit(:promo_type, :image, :details,
                                      :description, :active, :from, :to, :starts, :ends,
                                      :mon, :tue, :wed, :thu, :fri, :sat, :sun)
  end

end


