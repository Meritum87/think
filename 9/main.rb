require_relative 'accessor'
require_relative 'validation'
require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

puts 'Это симулятор РЖД. Как и в оригинале, все плохо, но работает!'

# Interface implementation
class Control
  attr_accessor :stations_list, :route, :number_wagon

  NUMBER_TRAIN = /^[a-z0-9]{3}$|[a-z0-9]{3}[-][a-z0-9]{2}$/i

  def initialize
    @stations_list = []
    @trains_list = []
    @wagons_list = []
    menu
  end

  def menu
    meaning = nil
    while meaning != 0
      puts 'Для выбора желаемого действия введите соответствующую число:'
      puts '1 - создать станцию'
      puts '2 - создать поезд'
      puts '3 - создать маршрут'
      puts '4 - создать вагон'
      puts '5 - добавить станцию в маршрут'
      puts '6 - удалить станцию из маршрута'
      puts '7 - назначить маршрут'
      puts '8 - добавить вагон'
      puts '9 - отцепить вагона'
      puts '10 - переместить поезд вперед'
      puts '11 - переместить поезд назад'
      puts '12 - посмотреть список станций'
      puts '13 - посмотреть список поездов на станции'
      puts '14 - вывод развернутого списка вагонов поезда'
      puts '15 - вывод развернутого списка поездов на станции'
      puts '16 - занять место в вагоне'
      meaning = gets.chomp.to_i
      meaning_activation(meaning)
    end
  end

  def meaning_activation(meaning)
    case meaning
    when 1
      create_station
    when 2
      crete_train
    when 3
      crete_route
    when 4
      crete_wagon
    when 5
      add_station
    when 6
      delet_station
    when 7
      assign_route
    when 8
      add_wagon
    when 9
      delete_wagon
    when 10
      moving_forward
    when 11
      moving_back
    when 12
      station_list
    when 13
      trains_list
    when 14
      train_wagon_list
    when 15
      station_train_list
    when 16
      filling_wagon
    else
      puts 'Введено неверное значение, попробуйте еще раз!'
    end
  end

  protected

  def create_station
    puts 'Введите название станции:'
    name = gets.chomp.to_s
    @stations_list << Station.new(name)
  end

  def crete_train
    puts 'Для создания пассажирского поезда введите - 1, грузового - 2:'
    type_train = gets.chomp.to_i

    raise if type_train != 1 && type_train != 2

    puts 'Введите номер поезда:'
    number = gets.chomp

    raise if number !~ NUMBER_TRAIN

    @trains_list << PassengerTrain.new(number) if type_train == 1

    @trains_list << CargoTrain.new(number) if type_train == 2

    puts "Создан поезд №: #{number}"
  rescue StandardError
    puts 'ОШИБКА!!! ВВЕДЕНЫ НЕВЕРНЫЕ ДАННЫЕ!'
    retry
  end

  def crete_route
    puts 'Введите начальную станцию маршрута:'

    name_start_station = gets.chomp.to_s
    start_station = nil

    @stations_list.each do |station|
      start_station = station if station.name == name_start_station
    end

    puts 'Введите конечную станцию маршрута:'

    name_end_station = gets.chomp.to_s
    end_station = nil

    @stations_list.each do |station|
      end_station = station if station.name == name_end_station
    end

    @route = Route.new(start_station, end_station)
  end

  def crete_wagon
    puts 'Для создания пассажирского вагона введите - 1, грузового - 2:'
    type_wagon = gets.chomp.to_i
    case type_wagon
    when 1
      puts 'Введите номер вагона:'
      number = gets.chomp
      puts 'Введите количество мест:'
      capacity = gets.chomp.to_i
      @wagons_list << PassengerWagon.new(number, capacity)
    when 2
      puts 'Введите номер вагона:'
      number = gets.chomp
      puts 'Введите вместимость:'
      capacity = gets.chomp.to_i
      @wagons_list << CargoWagon.new(number, capacity)
    end
  end

  def add_station
    puts 'Введите промежуточную станцию:'
    name_station = gets.chomp.to_s
    intermedia_station = nil

    @stations_list.each do |station|
      intermedia_station = station if station.name == name_station
    end

    @route.stations.insert(-2, intermedia_station)
  end

  def delet_station
    puts 'Введите удаляемую станцию:'
    number_station = gets.chomp.to_s
    delet_station = nil

    @stations_list.each do |station|
      delet_station = station if station.name == number_station
    end

    if delet_station != @route.stations[0] && delet_station != @route.stations[-1]
      @route.stations.delete(delet_station)
    end
  end

  def assign_route
    puts 'Введите номер поезда для добавления маршрута:'
    number_train = gets.chomp
    added_train = nil

    @trains_list.each do |train|
      added_train = train if train.number == number_train
    end
    added_train.add_route(route)
  end

  def add_wagon
    puts 'Введите номер поезда для добавления вагона:'
    number_train = gets.chomp
    puts 'Введите номер добавляемого вагона:'
    number_wagon = gets.chomp
    added_train = nil
    added_wagon = nil

    @trains_list.each do |train|
      added_train = train if train.number == number_train
    end

    @wagons_list.each do |wagon|
      added_wagon = wagon if wagon.number_wagon == number_wagon
    end

    added_train.add_wagon(added_wagon)
  end

  def delete_wagon
    puts 'Введите номер поезда для удаления вагона:'
    number_train = gets.chomp
    puts 'Введите номер удаляемого вагона:'
    number_wagon = gets.chomp
    disconection_train = nil
    disconection_wagon = nil

    @trains_list.each do |train|
      disconection_train = train if train.number == number_train
    end

    @wagons_list.each do |wagon|
      disconection_wagon = wagon if wagon.number_wagon == number_wagon
    end

    disconection_train.delete_wagon(disconection_wagon)
  end

  def moving_forward
    puts 'Введите номер поезда для перемещения:'
    number_train = gets.chomp
    mov_train = nil

    @trains_list.each do |train|
      mov_train = train if train.number == number_train
    end

    mov_train.move_forward
  end

  def moving_bask
    puts 'Введите номер поезда для перемещения:'
    number_train = gets.chomp
    mov_train = nil

    @trains_list.each do |train|
      mov_train = train if train.number == number_train
    end

    mov_train.move_back
  end

  def station_list
    puts 'Созданы следующие станции:'
    @stations_list.each { |station| puts station.name }
  end

  def trains_list
    puts 'Введите станцию для просмотра списка поездов:'

    name_station = gets.chomp.to_s
    print_station = nil

    @stations_list.each do |station|
      print_station = station if station.name == name_station
    end

    print_station.puts_list
  end

  def train_wagon_list
    puts 'Введите поезд для просмотра списка вагонов:'

    number_train = gets.chomp

    @trains_list.each do |train|
      next unless train.number == number_train
      train.all_wagons do |wagon|
        puts "Вагон №: #{wagon.number_wagon}, тип вагона: #{wagon.type_wagon},
        максимальная вместимость: #{wagon.capacity}, всего
        занято: #{wagon.busy}."
      end
    end
  end

  def station_train_list
    puts 'Введите станцию для просмотра списка поездов:'

    name_station = gets.chomp.to_s

    @stations_list.each do |station|
      next unless station.name == name_station
      station.all_trains do |train|
        puts "Поезд №: #{train.number}, тип поезда: #{train.type_train},
        количество вагонов: #{train.wagons.size}."
      end
    end
  end

  def filling_wagon
    puts 'Введите вагон:'
    number_wagon = gets.chomp
    @wagons_list.each do |wagon|
      if wagon.number_wagon == number_wagon && wagon.type_wagon == 'passenger'
        wagon.take_seat
      elsif wagon.number_wagon == number_wagon && wagon.type_wagon == 'cargo'
        puts 'Введите занимаемый объем:'
        volume = gets.chomp.to_i
        wagon.fill_volume(volume)
      end
    end
  end
end
