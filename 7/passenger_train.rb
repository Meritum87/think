class PassengerTrain < Train

  def initialize(number)
    super
    @type_train = 'passenger'
  end

  def add_wagon(wagon)

    if @speed == 0 && wagon.type_wagon == 'passenger'
      @wagons << wagon
    else
      puts "Неверный тип вагона!"
    end
  end
end
