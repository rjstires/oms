require 'test_helper'

class PrimaryStatsControllerTest < ActionController::TestCase
  setup do
    @primary_stat = primary_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primary_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primary_stat" do
    assert_difference('PrimaryStat.count') do
      post :create, primary_stat: { name: @primary_stat.name }
    end

    assert_redirected_to primary_stat_path(assigns(:primary_stat))
  end

  test "should show primary_stat" do
    get :show, id: @primary_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @primary_stat
    assert_response :success
  end

  test "should update primary_stat" do
    patch :update, id: @primary_stat, primary_stat: { name: @primary_stat.name }
    assert_redirected_to primary_stat_path(assigns(:primary_stat))
  end

  test "should destroy primary_stat" do
    assert_difference('PrimaryStat.count', -1) do
      delete :destroy, id: @primary_stat
    end

    assert_redirected_to primary_stats_path
  end
end
