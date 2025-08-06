class MixedUuidRecord < ApplicationRecord
  before_create :assign_random_uuid

  private

  def assign_random_uuid
    self.id ||= [ SecureRandom.uuid_v4, SecureRandom.uuid_v7 ].sample
  end
end
