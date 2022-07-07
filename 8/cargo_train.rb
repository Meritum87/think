# work with CargoTrain subclass
class CargoTrain < Train
  def initialize(number)
    super
    @type_train = 'cargo'
  end

  def add_wagon(wagon)
    if @speed.zero? && wagon.type_wagon == 'cargo'
      @wagons << wagon
    else
      puts 'Неверный тип вагона!'
    end
  end
end
