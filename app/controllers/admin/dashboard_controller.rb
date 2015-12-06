class Admin::DashboardController < AdminController
  def index
    @orders_incomplete = OrderLine.index_join.where_order_paid.where_not_completed

    @unsettled_sales_total = @orders_incomplete.sum(:sale).to_i
    @unsettled_sales_commission = @orders_incomplete.sum(:site_fee).to_i

    @orders_dispatched = OrderLine.index_join.scheduled.upcoming_event.scheduled_at_asc
    @orders_ready_to_dispatch = OrderLine.index_join.pending_scheduling.order_asc
    @orders_past_due = OrderLine.index_join.where_not_completed.past_event.scheduled_at_asc
    @orders_lead = OrderLine.index_join.leads

    store_location
  end

  def scheduled
    @order_lines = OrderLine.scheduled.scheduled_at_asc
    render 'admin/dashboard/table_view'
  end

  def pending_scheduling
    @order_lines = OrderLine.pending_scheduling.scheduled_at_asc
    render 'admin/dashboard/table_view'
  end

  def leads
    @order_lines = OrderLine.leads.created_at_asc
    render 'admin/dashboard/table_view'
  end
end
