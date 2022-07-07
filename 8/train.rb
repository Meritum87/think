# work with Train class
class Train
  include Manufacturer
  include InstanceCounter
  include Valid
  attr_reader :number, :type_train
  attr_accessor :route, :wagons, :current_station

  NUMBER_TRAIN = /^[a-z0-9]{3}$|[a-z0-9]{3}[-][a-z0-9]{2}$/i

  @@trains = []

  def self.find(number)
    @@trains.find { |train| train.number == number }
  end

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    validate!
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

  def all_wagons(&block)
    array = []
    @wagons.each { |wagon| array << wagon }
    array.each(&block)
  end

  protected

  def validate!
    errors = []
    errors << 'Не указан номер поезда!' if number.to_s.length < 0
    errors << 'Номер поезда указан неверно' if number !~ NUMBER_TRAIN
    raise errors.join('.') unless errors.empty?
  end
end
