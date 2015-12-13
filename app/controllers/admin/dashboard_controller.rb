class Admin::DashboardController < AdminController
  def index

    @orders_scheduled = OrderLine.scheduled.scheduled_at_asc
    @orders_pending_scheduling = OrderLine.pending_scheduling.scheduled_at_asc
    @orders_leads = OrderLine.leads.created_at_asc
    @orders_unsettled = OrderLine.unsettled.created_at_asc

    # Flat Block queries
    @upcoming_vacancies = EventSlot.upcoming_vacancies

    @team_totals = OrderLine
    .joins(:team)
    .select('SUM(order_lines.sale) as sum, COUNT(order_lines.id) as count, teams.name as name')
    .where_completed
    .order('sum DESC')
    .group('teams.name')
    .limit(5)

    @customer_totals = OrderLine
    .joins(:customer)
    .select('SUM(order_lines.sale) as sum, COUNT(order_lines.id) as count, customers.email as email')
    .where_completed
    .order('sum DESC')
    .group('customers.email')
    .limit(5)

    store_location
  end

  def scheduled
    @order_lines = OrderLine.index_join.scheduled.scheduled_at_asc
    @name = "Scheduled Orders";
    render 'admin/dashboard/table_view'
  end

  def pending_scheduling
    @name = "Order Pending Scheduling";
    @order_lines = OrderLine.index_join.pending_scheduling.scheduled_at_asc
    render 'admin/dashboard/table_view'
  end

  def leads
    @name = "Leads";
    @order_lines = OrderLine.index_join.leads.created_at_asc
    render 'admin/dashboard/table_view'
  end
end
