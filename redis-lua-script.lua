-- ARGV[1] is the user's account name.
-- ARGV[2] is the charge value.
-- returns an array with two values. The first is whether the operation succeeded, the second is the remaining balance.
if redis.call('EXISTS', ARGV[1]) == 1 and tonumber(redis.call('GET', ARGV[1])) >= tonumber(ARGV[2]) then redis.call('SET', ARGV[1], tostring(tonumber(redis.call('GET', ARGV[1])) - tonumber(ARGV[2]))); return {true, redis.call('GET', ARGV[1])} else return {false, redis.call('GET', ARGV[1])} end;