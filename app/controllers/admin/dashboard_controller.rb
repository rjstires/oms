class Admin::DashboardController < AdminController
  def index
    @teams_without_members = Team.includes(:memberships).where( :memberships => {:team_id => nil} )
    @teams_without_owner = Team.where('NOT EXISTS (SELECT null FROM memberships WHERE memberships.team_id = teams.id AND owner = true)')
    @orders_team_payment_outstanding = OrderLine.index_join.where_completed.where_team_not_paid
    @orders_ready_to_dispatch = OrderLine.index_join.ready_to_dispatch
    @orders_lead = OrderLine.index_join.leads
    @orders_past_due = OrderLine.index_join.past_due
    @orders_dispatched = OrderLine.index_join.dispatched.order_by_scheduled
    store_location
  end
end
