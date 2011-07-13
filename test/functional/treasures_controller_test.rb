require 'test_helper'

class TreasuresControllerTest < ActionController::TestCase
  setup do
    @treasure = treasures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treasures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treasure" do
    assert_difference('Treasure.count') do
      post :create, :treasure => @treasure.attributes
    end

    assert_redirected_to treasure_path(assigns(:treasure))
  end

  test "should show treasure" do
    get :show, :id => @treasure.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @treasure.to_param
    assert_response :success
  end

  test "should update treasure" do
    put :update, :id => @treasure.to_param, :treasure => @treasure.attributes
    assert_redirected_to treasure_path(assigns(:treasure))
  end

  test "should destroy treasure" do
    assert_difference('Treasure.count', -1) do
      delete :destroy, :id => @treasure.to_param
    end

    assert_redirected_to treasures_path
  end
end
