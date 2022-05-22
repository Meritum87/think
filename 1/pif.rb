puts "Введите сторону а:"
a = gets.chomp.to_i

puts "Введите сторону b:"
b = gets.chomp.to_i

puts "Введите сторону c:"
c = gets.chomp.to_i

if ((a**2 + b**2 == c**2) || (a**2 + c**2 == b**2)) || (b**2 + c**2 == a**2) == true
  puts "Треугольник прямоугольный!"
else
  puts "Треугольник не прямоугольный!"
end

if (a == b && b == c) == true
  puts "Треугольник равносторонний!"
elsif (a == b || b == c) || (a == c) == true
  puts "Треугольник равнобедренный!"
else
  puts "У треугольника все стороны разные!"
end
