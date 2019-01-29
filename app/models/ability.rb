class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new # guest user (not logged in)
    if user.admin?
        can :manage, [User, Author, Publisher, Book, Category, BorrowDetail]
        can [:read, :accept_request, :deny_request, :create], Borrow
        can [:edit, :update, :destroy], Borrow, user_id: user.id
    else
        can :read, [User, Author, Publisher, Book, Category, Borrow]
        can [:update, :destroy], User, id: user.id
        can [:create, :read, :edit, :update, :destroy], Borrow, user_id: user.id
        can [:create, :update, :destroy], BorrowDetail
        cannot [:accept_request, :deny_request], Borrow
    end
end
end
