class RecipePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present?
  end
end