module ClientsHelper
  def find_client id
    @client = Client.find(id)
  end

  def published_yes_no published
    if published
      "glyphicon glyphicon-ok text-success"
    else
      "glyphicon glyphicon-remove text-danger"
    end
  end
end
