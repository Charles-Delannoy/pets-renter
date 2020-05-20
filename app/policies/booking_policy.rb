class BookingPolicy < ApplicationPolicy

  def create?
    record.pet.user != user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
