puts "Введите коэффициент а:"
a = gets.chomp.to_i

puts "Введите коэффициент b:"
b = gets.chomp.to_i

puts "Введите коэффициент c:"
c = gets.chomp.to_i

discriminant = b**2.0 - 4.0 * a * c
square_root = Math.sqrt(discriminant)

if discriminant > 0
  puts "Корень №1 = #{x1 = ((0 - b) + square_root) / 2.0 * a}"
  puts "Корень №2 = #{x2 = ((0 - b) - square_root) / 2.0 * a}"
elsif discriminant == 0
  puts "Корень = #{x = (0 - b) / 2.0 * a}"
else
  puts "Корней нет!"
end
