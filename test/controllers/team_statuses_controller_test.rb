require 'test_helper'

class TeamStatusesControllerTest < ActionController::TestCase
  setup do
    @team_status = team_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_status" do
    assert_difference('TeamStatus.count') do
      post :create, team_status: { name: @team_status.name }
    end

    assert_redirected_to team_status_path(assigns(:team_status))
  end

  test "should show team_status" do
    get :show, id: @team_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_status
    assert_response :success
  end

  test "should update team_status" do
    patch :update, id: @team_status, team_status: { name: @team_status.name }
    assert_redirected_to team_status_path(assigns(:team_status))
  end

  test "should destroy team_status" do
    assert_difference('TeamStatus.count', -1) do
      delete :destroy, id: @team_status
    end

    assert_redirected_to team_statuses_path
  end
end
