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

  def accept?
    update?
  end

  def refuse?
    update?
  end

  class Scope < Scope
    def resolve
      scope.order(created_at: :desc)
    end
  end
end
