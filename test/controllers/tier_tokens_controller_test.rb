require 'test_helper'

class TierTokensControllerTest < ActionController::TestCase
  setup do
    @tier_token = tier_tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tier_tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tier_token" do
    assert_difference('TierToken.count') do
      post :create, tier_token: { name: @tier_token.name }
    end

    assert_redirected_to tier_token_path(assigns(:tier_token))
  end

  test "should show tier_token" do
    get :show, id: @tier_token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tier_token
    assert_response :success
  end

  test "should update tier_token" do
    patch :update, id: @tier_token, tier_token: { name: @tier_token.name }
    assert_redirected_to tier_token_path(assigns(:tier_token))
  end

  test "should destroy tier_token" do
    assert_difference('TierToken.count', -1) do
      delete :destroy, id: @tier_token
    end

    assert_redirected_to tier_tokens_path
  end
end
