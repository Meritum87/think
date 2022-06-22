class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number
  attr_accessor :route, :wagons, :current_station

  @@trains = []

  def self.find(number)
    tr = nil
    @@trains.each {|train| tr = train if train.number == number}
    tr
  end

  def initialize(number, manufacturer_train)
    @number = number
    @wagons = []
    @speed = 0
    @manufacturer_train = manufacturer_train
    @@trains << self
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
