require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should post create" do

    post :create, client: {name:'Maga Muffins'}
    assert_redirected_to client_path(assigns(:client))
    # assert_select 'h1', "vClients#create"
  end

#   test "should get show" do
#     get :show
#     assert_response :success
#   end
#
#   test "should get index" do
#     get :index
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get :edit
#     assert_response :success
#   end
#
#   test "should get update" do
#     get :update
#     assert_response :success
#   end
#
#   test "should get destroy" do
#     get :destroy
#     assert_response :success
#   end
#
end
