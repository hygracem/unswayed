class ArticlesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all -> why undefined method all error?
      scope
    end
  end

  def index?
    true
  end
end
