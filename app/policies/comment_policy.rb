class CommentPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
