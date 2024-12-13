class AccountPolicy < ApplicationPolicy
  def show?
    user.not_guest?
  end
end
