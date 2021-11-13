class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role.eql? 'Admin'
      can :manage, :all
    else
      can :read, :all
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
