class Admin::DashboardController < AdminController
  def index
    @incomplete_orders = OrderLine.where_order_paid.where_not_completed
    @unsettled_sale = @incomplete_orders.sum(:sale).to_i
    @unsettled_commission = @incomplete_orders.sum(:site_fee).to_i

    @orders_dispatched = OrderLine.index_join.scheduled.upcoming_event.scheduled_at_asc
    @orders_ready_to_dispatch = OrderLine.index_join.ready_to_schedule.order_asc
    @orders_past_due = OrderLine.index_join.where_not_completed.past_event.scheduled_at_asc
    @orders_lead = OrderLine.index_join.lead

    store_location
  end
end
