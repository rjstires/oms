class Admin::DashboardController < AdminController
  def index
    @teams_without_members = Team.includes(:memberships).where( :memberships => {:team_id => nil} )
    @teams_without_owner = Team.where('NOT EXISTS (SELECT null FROM memberships WHERE memberships.team_id = teams.id AND owner = true)')
    @orders_team_payment_outstanding = OrderLine.index_join.completed_pending_team_payment
    @orders_ready_to_dispatch = OrderLine.index_join.ready_to_schedule
    @orders_lead = OrderLine.index_join.lead
    @orders_past_due = OrderLine.index_join.where_not_completed.past_event
    @orders_dispatched = OrderLine.index_join.scheduled.upcoming_event
    store_location
  end
end
