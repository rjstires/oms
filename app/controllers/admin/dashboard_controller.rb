class Admin::DashboardController < AdminController
  def index
    @orders_dispatched = OrderLine.index_join.scheduled.upcoming_event.scheduled_at_asc
    @orders_ready_to_dispatch = OrderLine.index_join.ready_to_schedule.created_at_asc
    @orders_past_due = OrderLine.index_join.where_not_completed.past_event.scheduled_at_asc
    @orders_lead = OrderLine.index_join.lead.created_at_asc
    store_location
  end
end
