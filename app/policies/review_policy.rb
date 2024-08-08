class ReviewPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.author_id == user.id || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (record.author_id == user.id || user.admin?)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
