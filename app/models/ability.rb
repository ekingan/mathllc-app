class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :manage, Payment
      can :manage, User, id: user.id
      can :manage, Client
      can :manage, Job
      can :read, Preparer, user_id: user.id
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Wage, preparer_id: user.preparer.id
    end
    # can :read, User
    # can :manage, User, id: user.id
    # can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: :admin
  end

end
