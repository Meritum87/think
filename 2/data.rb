puts "Введите день:"
day = gets.chomp.to_i

puts "Введите месяц:"
month = gets.chomp.to_i

puts "Введите год:"
year = gets.chomp.to_i

amount_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
summa = day
counter = -1

amount_day.each do |sum| counter = counter + 1
  if counter < month - 1
    summa = summa + sum
  else
  end
end

if (year % 4 == 0 && (year % 100 == 0 && false )) || (year % 100 == 0 && year % 400 == 0)
  puts "Порядковый номер дня в году: #{summa + 1}"
else
  puts "Порядковый номер дня в году: #{summa}"
end
