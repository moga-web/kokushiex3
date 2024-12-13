class MiniTestPolicy < ApplicationPolicy
  def index?
    user.not_guest?
  end
end
