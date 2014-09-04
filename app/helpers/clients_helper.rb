module ClientsHelper
  def find_client id
    @client = Client.find(id)
  end
end
