class PortfolioPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user&.admin?
  end

  def update?
    user&.admin?
  end

  def destroy?
    user&.admin?
  end

  def sort?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
