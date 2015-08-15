class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    end

    if user.approved?

      # OrderLine (C R U D) + Complete
      can [:read, :complete], OrderLine, :team_id => user.teams_id_list

      # Team (C R U D) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      can :create, Team

      can :read, Team, :id => user.teams_id_list
      can [:update, :destroy], Team, :id => user.owned_teams_id_list

      # Option (C R U D)
      can :read, Option
      cannot [:create, :update, :destory], Option

      # Membership (CRUD)
      can :create, Membership
      can [:read, :update], Membership, :team_id => user.owned_teams_id_list
      cannot [:destroy], Membership, :team_id => user.owned_teams_id_list

      # Customer (C R U D)
      cannot [:read, :index], Customer

      # Lead
      cannot [:create, :update, :destory], Lead
      can :read, Lead
    end

    if user.registered?
      cannot [:read, :index], :all
    end

  end
end
