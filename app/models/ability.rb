class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Food, user:
  end
end
