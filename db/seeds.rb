# db/seeds.rb
require 'securerandom'

puts "Seeding UUIDv4 records..."
1_500_000.times.each_slice(1_000) do |slice|
  UuidV4Record.insert_all!(
    Array.new(1_000) { { id: SecureRandom.uuid, name: "V4 Name #{rand(1..999_999)}", created_at: Time.now, updated_at: Time.now } }
  )
end

puts "Seeding UUIDv7 records..."
1_500_000.times.each_slice(1_000) do |slice|
  UuidV7Record.insert_all!(
    Array.new(1_000) { { id: SecureRandom.uuid_v7, name: "V7 Name #{rand(1..999_999)}", created_at: Time.now, updated_at: Time.now } }
  )
end

puts "Seeding complete."
