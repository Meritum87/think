checks = Hash.new { }
total_check = 0

loop do
  puts "Введите наименование товара:"
  probuct = gets.chomp
  break puts checks if probuct == "стоп"
  puts "Введите цену товара:"
  prise = gets.chomp
  break puts checks if prise == "стоп"
  puts "Введите количество товара:"
  amount = gets.chomp
  break puts checks if amount == "стоп"
  else
  checks [probuct] = [prise.to_f, amount.to_f]
end

checks.each do |check, total|
  puts "Затраты на #{check} составили: #{total.reduce(&:*)}."
  total_check = total_check + total.reduce(&:*)
end

puts "Всего покупок в корзине на сумму: #{total_check}."
