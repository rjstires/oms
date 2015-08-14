require 'test_helper'

class PlayStylesControllerTest < ActionController::TestCase
  setup do
    @play_style = play_styles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:play_styles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create play_style" do
    assert_difference('PlayStyle.count') do
      post :create, play_style: { name: @play_style.name }
    end

    assert_redirected_to play_style_path(assigns(:play_style))
  end

  test "should show play_style" do
    get :show, id: @play_style
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @play_style
    assert_response :success
  end

  test "should update play_style" do
    patch :update, id: @play_style, play_style: { name: @play_style.name }
    assert_redirected_to play_style_path(assigns(:play_style))
  end

  test "should destroy play_style" do
    assert_difference('PlayStyle.count', -1) do
      delete :destroy, id: @play_style
    end

    assert_redirected_to play_styles_path
  end
end
