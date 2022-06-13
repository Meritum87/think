require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'

puts 'Приветствуем Вас в симуляторе РЖД. Как и в оригинале, все плохо, но работает!'

class Control
  attr_accessor :stations_list, :route, :number_wagon

  def initialize
    @stations_list = []
    @trains_list = []
    @wagons_list = []
  end

  def menu
    meaning = nil
    while meaning != 0 do
    puts 'Для выбора желаемого действия введите соответствующую число:'
    puts '1 - создать станцию'
    puts '2 - создать поезда'
    puts '3 - создать маршрут'
    puts '4 - создать вагон'
    puts '5 - добавить станцию в маршрут'
    puts '6 - удалить станцию из маршрут'
    puts '7 - назначить маршрут'
    puts '8 - добавить вагон'
    puts '9 - отцепить вагона'
    puts '10 - переместить поезд вперед'
    puts '11 - переместить поезд назад'
    puts '12 - посмотреть список станций'
    puts '13 - посмотреть список поездов на станции'
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
        stations_list
      when 13
        trains_list
      else
        puts 'Введено неверное значение, попробуйте еще раз!'
    end
  end

  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    @stations_list << Station.new(name)
  end

  def crete_train
    puts 'Для создания пассажирского поезда введите - 1, грузового - 2:'
    type_train = gets.chomp.to_i
    puts 'Введите номер поезда:'
    number = gets.chomp

    if type_train == 1
      @trains_list << PassengerTrain.new(number)
    else
    end

    if type_train == 2
      @trains_list << CargoTrain.new(number)
    else
    end
  end

  def crete_route

    puts 'Введите начальную станцию маршрута:'

    s1 = gets.chomp
    stat1 = nil

    @stations_list.each do|station|
      stat1 = station if station.name == s1
    end

    puts 'Введите конечную станцию маршрута:'

    s2 = gets.chomp
    stat2 = nil

    @stations_list.each do|station|
      stat2 = station if station.name == s2
    end

    @route = Route.new(stat1, stat2)
  end

  def crete_wagon
    puts 'Для создания пассажирского вагона введите - 1, грузового - 2:'
    type_wagon = gets.chomp.to_i
    puts 'Введите номер вагона:'
    number = gets.chomp

    if type_wagon == 1
      @wagons_list << PassengerWagon.new(number)
    else
    end

    if type_wagon == 2
      @wagons_list << CargoWagon.new(number)
    else
    end
  end

  def add_station
    puts 'Введите промежуточную станцию:'
    s = gets.chomp
    stat = nil

    @stations_list.each do|station|
      stat = station if station.name == s
    end

    @route.stations.insert(-2, stat)
  end

  def delet_station
    puts 'Введите удаляемую станцию:'
    s = gets.chomp
    stat = nil

    @stations_list.each do|station|
      stat = station if station.name == s
    end

    @route.stations.delete(stat) if stat != @route.stations[0] && @route.stations[-1] != stat
  end

  def assign_route
    puts 'Введите номер поезда для добавления маршрута:'
    t = gets.chomp
    tr = nil

    @trains_list.each do|train|
      tr = train if train.number == t
    end
    tr.add_route(route)
  end

  def add_wagon
    puts 'Введите номер поезда для добавления вагона:'
    t = gets.chomp
    puts 'Введите номер добавляемого вагона:'
    w = gets.chomp
    tr = nil
    wg = nil

    @trains_list.each do|train|
      tr = train if train.number == t
    end

    @wagons_list.each do|wagon|
      wg = wagon if wagon.number_wagon == w
    end

    tr.add_wagon(wg)
  end

  def delete_wagon
    puts 'Введите номер поезда для удаления вагона:'
    t = gets.chomp
    puts 'Введите номер удаляемого вагона:'
    w = gets.chomp
    tr = nil
    wg = nil

    @trains_list.each do|train|
      tr = train if train.number == t
    end

    @wagons_list.each do|wagon|
      wg = wagon if wagon.number_wagon == w
    end

    tr.delete_wagon(wg)
  end

  def moving_forward
    puts 'Введите номер поезда для перемещения:'
    t = gets.chomp
    tr = nil

    @trains_list.each do|train|
      tr = train if train.number == t
    end

    tr.move_forward
  end

  def moving_bask
    puts 'Введите номер поезда для перемещения:'
    t = gets.chomp
    tr = nil

    @trains_list.each do|train|
      tr = train if train.number == t
    end

    tr.move_back
  end

  def stations_list
    puts 'Созданы следующие станции:'
    @stations_list.each {|station| puts station.name}
  end

  def trains_list
    puts 'Введите станцию для просмотра списка поездов:'

    s = gets.chomp
    stat = nil

    @stations_list.each do|station|
      stat = station if station.name == s
    end

    stat.puts_list
  end

end
