class ClientsController < ApplicationController
  after_action :verify_authorized, except: [:index, :show]

  def new
    @client = Client.new
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    authorize @client
    # TODO update message to match business use
    if @client.save
      current_user.update({client_id: @client.id})
      redirect_to @client, notice: "Successfully added client"
    else
      flash.now.alert="Could not add new client"
      render 'new'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def index
    @clients = Client.all
  end

  def edit
    @client = Client.find(params[:id])
    authorize @client
  end

  def update
    @client = Client.find(params[:id])
    authorize @client
    if @client.update(client_params)
      redirect_to @client, notice: 'Successfully updated'
    else
      flash.now.alert = 'Failed to update'
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    authorize @client
    if @client.destroy
      message = "Item deleted"
    else
      message = "Could not delete item"
    end
    redirect_to clients_path, notice: message
  end

  private
  def client_params
    params.require(:client).permit(:name, :tel, :email, :website, :photo)
  end

end
