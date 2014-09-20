class ClientsController < ApplicationController
  def new
  end

  def create
    # TODO remove debug output
    puts "create..."
    @client = Client.new(client_params)
    puts "after new client"
    if @client.save
      puts "client saved"
      redirect_to @client
    else
      puts "renders new"
      flash[:notice]="could not add new client"
      render 'new'
    end
    puts "...create end"
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
  #   TODO set flash if not found
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
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
