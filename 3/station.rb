class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def puts_list
    puts "На станции находятся следующие поезда:"
    @trains.each {|train| puts train.number}
  end

  def puts_type(typ)
    p = 0
    puts "Список поездов типа #{typ}:"
    @trains.each do|train|
       if train.type == typ
         puts train.number
         p += 1
       else
       end
       puts "Всего поездов типа #{typ}: #{p}"
    end
  end

  def delete_train(train)
    @trains.delete(train)
  end
end

class Route
  attr_accessor :stations

  def initialize(starting_station, end_station)
    @stations = [starting_station, end_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station) if station != @stations[0] && @stations[-1] != station
  end

  def puts_station
    @stations.each {|station| puts station.name}
  end
end

class Train
  attr_reader :number, :type, :wagons
  attr_accessor :route

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def speed(speed)
    @speed = speed
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def puts_wagons
    @wagons
  end

  def add_wagons
    if @speed == 0
      puts "Чтобы прицепить вагон нажмите +, чтобы отцепить -:"
      s = gets.chomp
    else
      puts "Поезд движется, перецепка невозможна!"
    end

    if s == "+"
      @wagons += 1
    elsif s == "-"
      @wagons -=  1
    else
    end
  end

  def add_route(route)
    self.route = route
    @index = 0
  end

  def current_station
    route.stations[@index]
  end

  def next_station
    route.stations[@index + 1]
  end

  def previous_station
    route.stations[@index - 1]
  end

  def move_forward
    @index += 1
  end

  def move_back
    @index -= 1
  end

end
