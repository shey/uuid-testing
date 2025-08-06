require 'benchmark'

N = 3000

Benchmark.bm do |x|
  x.report("UuidV4Record.first (#{N}x)") do
    N.times { UuidV4Record.first }
  end

  x.report("UuidV7Record.first (#{N}x)") do
    N.times { UuidV7Record.first }
  end

  x.report("MixedUuidRecord.first (#{N}x)") do
    N.times { MixedUuidRecord.first }
  end
end
