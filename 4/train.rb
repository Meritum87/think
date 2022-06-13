class Train
  attr_reader :number
  attr_accessor :route, :wagons, :current_station

  def initialize(number)
    @number = number
    @wagons = []
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

  def add_route(route)
    self.route = route
    @current_station = route.stations[0]
    @current_station.add_train(self)
  end

  def move_forward
    index = route.stations.index(@current_station)
    @current_station.delete_train(self)
    @current_station = route.stations[index + 1]
    @current_station.add_train(self)
  end

  def move_back
    index = route.stations.index(@current_station)
    @current_station.delete_train(self)
    @current_station = route.stations[index - 1]
    @current_station.add_train(self)
  end

  def delete_wagon(wagon)
    @wagons.delete(wagon)
  end

end

class PassengerTrain < Train

  def add_wagon(wagon)

    if @speed == 0 && wagon.type_wagon == 'passenger'
      @wagons << wagon
    else
      puts "Неверный тип вагона!"
    end
  end
end

class CargoTrain < Train

  def add_wagon(wagon)
    if @speed == 0 && wagon.type_wagon == 'cargo'
      @wagons << wagon
    else
      puts "Неверный тип вагона!"
    end
  end
end
