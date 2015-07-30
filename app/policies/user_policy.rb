class UserPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope
  #   end
  # end

 def destroy?
   user.admin?
 end
end
