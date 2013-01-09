local needle   = KEYS[1]
local haystack = KEYS[2]

local len      = redis.call('llen', haystack)
local i        = 0

while (i < len+1) do
  local result = redis.call('lpop', haystack)
  if (result ~= needle) then
    redis.call('rpush', haystack, result)
  end
  i = i+1
end

return true