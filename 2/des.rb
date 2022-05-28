arr = [10]

while arr.last < 100 do
  arr << arr.last + 5
end

puts arr
