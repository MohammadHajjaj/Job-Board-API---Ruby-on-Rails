class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.admin?
      can :manage, JobPost
      cannot :destroy, JobApplication
      can :manage, JobApplication
    else 
      can :read, JobPost
      can :create, JobApplication
    end
  end
end
