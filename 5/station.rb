class Station
  include InstanceCounter
  attr_accessor :name
  attr_reader :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def puts_list
    puts "На станции находятся следующие поезда:"
    @trains.each {|train| puts train.number}
  end

  def add_train(train)
    @trains << train
  end

  def delete_train(train)
    @trains.delete(train)
  end
end
