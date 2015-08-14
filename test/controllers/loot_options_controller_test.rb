require 'test_helper'

class LootOptionsControllerTest < ActionController::TestCase
  setup do
    @loot_option = loot_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loot_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loot_option" do
    assert_difference('LootOption.count') do
      post :create, loot_option: { name: @loot_option.name }
    end

    assert_redirected_to loot_option_path(assigns(:loot_option))
  end

  test "should show loot_option" do
    get :show, id: @loot_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loot_option
    assert_response :success
  end

  test "should update loot_option" do
    patch :update, id: @loot_option, loot_option: { name: @loot_option.name }
    assert_redirected_to loot_option_path(assigns(:loot_option))
  end

  test "should destroy loot_option" do
    assert_difference('LootOption.count', -1) do
      delete :destroy, id: @loot_option
    end

    assert_redirected_to loot_options_path
  end
end
