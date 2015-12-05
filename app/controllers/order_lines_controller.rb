class OrderLinesController < ApplicationController
  load_and_authorize_resource :team
  load_and_authorize_resource :order_line, :through => :team

  # GET /order_lines
  # GET /order_lines.json
  def index
    @dispatched_orders = @team
    .order_lines
    .index_join
    .where_scheduled
    .where_not_completed
    .accessible_by(current_ability)

    @completed_orders = @team
    .order_lines
    .index_join
    .where_completed
    .accessible_by(current_ability)

    store_location
  end

  # GET /teams/1/sales/1
  def show
  end

  private
end
