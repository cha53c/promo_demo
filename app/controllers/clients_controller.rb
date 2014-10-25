class ClientsController < ApplicationController
  after_action :verify_authorized, except: [:index, :show]

  def new
    @client = Client.new()
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    authorize @client
    if @client.save
      flash[:notice]="successfully added client"
      redirect_to @client
    else
      flash.now.alert="Could not add new client"
      render 'new'
    end
  end

  def show
    @client = Client.find(params[:id])
    # TODO set flash if not found
  end

  def index
    @clients = Client.all
  end

  def edit
    @client = Client.find(params[:id])
    authorize @client
    # TODO set flash if not found
  end

  def update
    @client = Client.find(params[:id])
    authorize @client
    if @client.update(client_params)
      flash[:notice]='update complete'
      redirect_to @client
    else
      flash[:notice]='update failed'
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    authorize @client
    @client.destroy
    redirect_to clients_path
  end


  private
  def client_params
    params.require(:client).permit(:name, :tel, :email, :website, :photo)
  end

end
