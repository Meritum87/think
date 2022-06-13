class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
