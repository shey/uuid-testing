require 'benchmark'

N = 3000

# 🔥 Warm up the cache
puts "Warming up cache..."
300.times do
  UuidV7Record.first
  UuidV4Record.first
  MixedUuidRecord.first
end

# 🧪 Now run the actual benchmark
Benchmark.bm do |x|
  x.report("UuidV7Record.first (#{N}x)") do
    N.times { UuidV7Record.first }
  end

  x.report("UuidV4Record.first (#{N}x)") do
    N.times { UuidV4Record.first }
  end

  x.report("MixedUuidRecord.first (#{N}x)") do
    N.times { MixedUuidRecord.first }
  end
end
