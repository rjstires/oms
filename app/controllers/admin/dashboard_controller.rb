class Admin::DashboardController < AdminController
  def index
    @orders_incomplete = OrderLine
    .index_join
    .where_order_paid
    .where_not_completed

    @unsettled_sales_total = @orders_incomplete.sum(:sale).to_i

    @orders_scheduled = OrderLine
    .index_join
    .scheduled
    .upcoming_event
    .scheduled_at_asc

    @orders_pending_scheduling = OrderLine
    .index_join
    .pending_scheduling
    .order_asc

    @orders_past_due = OrderLine
      .index_join
      .where_not_completed
      .past_event
      .scheduled_at_asc

    @orders_leads = OrderLine.index_join.leads

    # Flat Block queries
    @upcoming_vacancies = EventSlot.upcoming_vacancies

    store_location
  end

  def scheduled
    @order_lines = OrderLine.scheduled.scheduled_at_asc
    @name = "Scheduled Orders";
    render 'admin/dashboard/table_view'
  end

  def pending_scheduling
    @name = "Order Pending Scheduling";
    @order_lines = OrderLine.pending_scheduling.scheduled_at_asc
    render 'admin/dashboard/table_view'
  end

  def leads
    @name = "Leads";
    @order_lines = OrderLine.leads.created_at_asc
    render 'admin/dashboard/table_view'
  end
end
