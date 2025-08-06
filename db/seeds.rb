# db/seeds.rb
require 'securerandom'

puts "Seeding UUIDv4 records..."
100_000.times.each_slice(1_000) do |slice|
  UuidV4Record.insert_all!(
    Array.new(1_000) do
      {
        id: SecureRandom.uuid,
        name: "V4 Name #{rand(1..10_000)}",
        created_at: Time.now,
        updated_at: Time.now
      }
    end
  )
end

puts "Seeding UUIDv7 records..."
100_000.times.each_slice(1_000) do |slice|
  UuidV7Record.insert_all!(
    Array.new(1_000) do
      {
        id: SecureRandom.uuid_v7,
        name: "V7 Name #{rand(1..10_000)}",
        created_at: Time.now,
        updated_at: Time.now
      }
    end
  )
end

puts "Seeding mixed records..."
100_000.times.each_slice(1_000) do |slice|
  MixedUuidRecord.insert_all!(
    Array.new(1_000) do
      {
        id: [SecureRandom.uuid, SecureRandom.uuid_v7].sample,
        name: "Mixed Name #{rand(1..10_000)}",
        created_at: Time.now,
        updated_at: Time.now
      }
    end
  )
end

puts "Seeding complete."
