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
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

protected

  def validate!
    raise "Не указано название станции!" if name.length < 0
    true
  end

end