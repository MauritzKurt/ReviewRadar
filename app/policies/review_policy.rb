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
      if user.admin?
        scope.all
      else
        scope.where(author_id: user.id)
      end
    end
  end
end
