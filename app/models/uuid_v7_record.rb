class UuidV7Record < ApplicationRecord
  before_create :assign_uuid_v7

  private

  def assign_uuid_v7
    self.id ||= SecureRandom.uuid_v7
  end
end
