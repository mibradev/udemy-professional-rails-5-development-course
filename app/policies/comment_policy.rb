class CommentPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user.present?
  end

  def destroy?
    user&.admin? || user&.comments&.find_by_id(record.id)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
