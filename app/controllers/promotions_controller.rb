class PromotionsController < ApplicationController
  def new
    @promotion = Promotion.new
  end

  def create
    @client = Client.find(params[:client_id])
    @promotion = @client.promotions.create(promotion_params)
    params[:valid_days] = build_weekdays_string
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
    # TODO remove start_date and end_date from db
    params.require(:promotion).permit(:promo_type, :start_date, :end_date, :image,
                                      :description, :active, :from, :to,:starts , :ends, :valid_days)

  end

  private
  def build_weekdays_string
    str = ''
    Promotion::WEEKDAYS.each do |d|
      if params[d.to_sym] == '1'
        str << '1'
      else
        str << '0'
      end
    end
    puts(str)
    str
  end
end


