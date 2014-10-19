class PromotionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
