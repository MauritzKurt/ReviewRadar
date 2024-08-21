# app/policies/scrape_policy.rb
class ScrapePolicy < ApplicationPolicy
  def show?
    user.admin?
  end
end
