puts "Как Вас зовут?"
name = gets.chomp

puts "Какой у Вас рост?"
growth = gets.chomp.to_i

ideal_weight = (growth - 110) * 1.15

if ideal_weight > 0
  puts "#{name}, Ваш идеальный вес #{ideal_weight}!"
else
  puts "Ваш вес уже оптимальный!"
end
