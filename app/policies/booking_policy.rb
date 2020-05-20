class BookingPolicy < ApplicationPolicy

  def create?
    record.pet.user != user
  end

  def bookings?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
