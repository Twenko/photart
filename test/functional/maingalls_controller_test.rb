require 'test_helper'

class MaingallsControllerTest < ActionController::TestCase
  setup do
    @maingall = maingalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maingalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maingall" do
    assert_difference('Maingall.count') do
      post :create, :maingall => @maingall.attributes
    end

    assert_redirected_to maingall_path(assigns(:maingall))
  end

  test "should show maingall" do
    get :show, :id => @maingall
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @maingall
    assert_response :success
  end

  test "should update maingall" do
    put :update, :id => @maingall, :maingall => @maingall.attributes
    assert_redirected_to maingall_path(assigns(:maingall))
  end

  test "should destroy maingall" do
    assert_difference('Maingall.count', -1) do
      delete :destroy, :id => @maingall
    end

    assert_redirected_to maingalls_path
  end
end
