class BookingPolicy < ApplicationPolicy

  def create?
    record.pet.user != user
  end

  def destroy?
    record.user == user
  end

  def update?
    record.pet.user == user
  end

  class Scope < Scope
    def resolve
      scope.order(created_at: :desc)
    end
  end
end
