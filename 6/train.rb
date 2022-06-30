class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number
  attr_accessor :route, :wagons, :current_station

  NUMBER_TRAIN = /^[a-z0-9]{3}$|[a-z0-9]{3}[-][a-z0-9]{2}$/i

  @@trains = []

  def self.find(number)
    @@trains.find {|train| train.number == number}
  end

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @@trains << self
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

protected

  def validate!
    raise "Не указан номер поезда!" if number.to_s.length < 0
    raise "Номер поезда указан неверно" if number !~ NUMBER_TRAIN
    true
  end
end
