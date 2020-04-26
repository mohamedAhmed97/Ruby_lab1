# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)  
    #can :read, Article, public: true

    if user.present?  # additional permissions for logged in users (they can read their own posts)
      #can :read, :all
      can :manage, Article ,user_id: user.id
      can :manage, Comment ,user_id: user.id
      can :manage, Comment ,user_id: user.id
    else
      can :read, Article 
      can :read, Comment
    end
  
  end
end
