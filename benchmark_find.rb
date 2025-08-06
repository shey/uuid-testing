require 'benchmark'

N = 50_000
LIMIT = 300

puts "Fetching midpoint UUIDs..."
mid_v7_id    = UuidV7Record.offset(UuidV7Record.count / 2).limit(1).pluck(:id).first
mid_v4_id    = UuidV4Record.offset(UuidV4Record.count / 2).limit(1).pluck(:id).first
mid_mixed_id = MixedUuidRecord.offset(MixedUuidRecord.count / 2).limit(1).pluck(:id).first

def prime_cache(model, id, limit)
  puts "Priming buffer cache for #{model.name}..."
  100.times { model.where("id > ?", id).limit(limit).to_a }
end

Benchmark.bm do |x|
  prime_cache(UuidV7Record, mid_v7_id, LIMIT)
  x.report("UuidV7Record range (#{N}x)") do
    N.times { UuidV7Record.where("id > ?", mid_v7_id).limit(LIMIT).to_a }
  end

  prime_cache(UuidV4Record, mid_v4_id, LIMIT)
  x.report("UuidV4Record range (#{N}x)") do
    N.times { UuidV4Record.where("id > ?", mid_v4_id).limit(LIMIT).to_a }
  end

  prime_cache(MixedUuidRecord, mid_mixed_id, LIMIT)
  x.report("MixedUuidRecord range (#{N}x)") do
    N.times { MixedUuidRecord.where("id > ?", mid_mixed_id).limit(LIMIT).to_a }
  end
end
