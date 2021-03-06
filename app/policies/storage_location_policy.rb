class StorageLocationPolicy < ApplicationPolicy
  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    return true if record.id == storage_location.id
  end

  def destroy?
    return true if record.id == storage_location.id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end