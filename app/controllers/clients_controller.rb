class ClientsController < ApplicationController
  def new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice]="successfully added client"
      redirect_to @client
    else
      flash[:notice]="could not add new client"
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
    # TODO set flash if not found
  end

  def update
    @client = Client.find(params[:id])
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
    @client.destroy
    redirect_to clients_path
  end


  private
  def client_params
    params.require(:client).permit(:name, :tel, :email, :website, :photo)
  end

end
