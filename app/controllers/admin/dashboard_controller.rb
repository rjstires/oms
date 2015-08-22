class Admin::DashboardController < AdminController
  def index
  	@teams_without_members = Team.includes(:memberships).where( :memberships => {:team_id => nil} )
  	@teams_without_owner = Team.where('NOT EXISTS (SELECT null FROM memberships WHERE memberships.team_id = teams.id AND owner = true)')

  end
end
