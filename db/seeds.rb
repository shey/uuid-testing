# db/seeds.rb
require 'securerandom'
require 'uuid/v7'

puts "Seeding UUIDv4 records..."
500_000.times.each_slice(1_000) do |slice|
  UuidV4Record.insert_all!(
    Array.new(1_000) { { id: SecureRandom.uuid, name: "V4 Name #{rand(1..999_999)}", created_at: Time.now, updated_at: Time.now } }
  )
end

puts "Seeding UUIDv7 records..."
500_000.times.each_slice(1_000) do |slice|
  UuidV7Record.insert_all!(
    Array.new(1_000) { { id: UUID.v7.to_s, name: "V7 Name #{rand(1..999_999)}", created_at: Time.now, updated_at: Time.now } }
  )
end

puts "Seeding complete."
