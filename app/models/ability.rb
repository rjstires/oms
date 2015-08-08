class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    end
    
    if user.registered?
      cannot :read, :all
    end
    
    if user.approved?
      # OrderLine (C R U D) + Complete
      cannot :create, OrderLine
      can [:read, :complete], OrderLine, :team => { :id => user.team_ids }
      cannot [:update, :destroy], OrderLine

      # Team (C R U D)
      can :create, Team
      can :read, Team, :id => user.team_ids
      can [:update, :destroy], Team, :user_id => user.id
      
      # Option (C R U D)
      can :read, Option
      cannot [:create, :update, :destory], Option
    end
  end
end
