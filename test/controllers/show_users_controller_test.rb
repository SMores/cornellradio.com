require 'test_helper'

class ShowUsersControllerTest < ActionController::TestCase
  setup do
    @show_user = show_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:show_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create show_user" do
    assert_difference('ShowUser.count') do
      post :create, show_user: { showID: @show_user.showID, userID: @show_user.userID }
    end

    assert_redirected_to show_user_path(assigns(:show_user))
  end

  test "should show show_user" do
    get :show, id: @show_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @show_user
    assert_response :success
  end

  test "should update show_user" do
    patch :update, id: @show_user, show_user: { showID: @show_user.showID, userID: @show_user.userID }
    assert_redirected_to show_user_path(assigns(:show_user))
  end

  test "should destroy show_user" do
    assert_difference('ShowUser.count', -1) do
      delete :destroy, id: @show_user
    end

    assert_redirected_to show_users_path
  end
end
