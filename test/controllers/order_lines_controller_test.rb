require 'test_helper'

class OrderLinesControllerTest < ActionController::TestCase
  setup do
    @order_line = order_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_line" do
    assert_difference('OrderLine.count') do
      post :create, order_line: { character_id: @order_line.character_id, contractor_payment: @order_line.contractor_payment, merchant_fee: @order_line.merchant_fee, order: @order_line.order, order_line_status_id: @order_line.order_line_status_id, payment_status_id: @order_line.payment_status_id, product_id: @order_line.product_id, sale: @order_line.sale, site_fee: @order_line.site_fee, team_id: @order_line.team_id }
    end

    assert_redirected_to order_line_path(assigns(:order_line))
  end

  test "should show order_line" do
    get :show, id: @order_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_line
    assert_response :success
  end

  test "should update order_line" do
    patch :update, id: @order_line, order_line: { character_id: @order_line.character_id, contractor_payment: @order_line.contractor_payment, merchant_fee: @order_line.merchant_fee, order: @order_line.order, order_line_status_id: @order_line.order_line_status_id, payment_status_id: @order_line.payment_status_id, product_id: @order_line.product_id, sale: @order_line.sale, site_fee: @order_line.site_fee, team_id: @order_line.team_id }
    assert_redirected_to order_line_path(assigns(:order_line))
  end

  test "should destroy order_line" do
    assert_difference('OrderLine.count', -1) do
      delete :destroy, id: @order_line
    end

    assert_redirected_to order_lines_path
  end
end
