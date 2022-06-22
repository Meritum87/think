class PassengerTrain < Train

  def add_wagon(wagon, manufacturer_train)

    if @speed == 0 && wagon.type_wagon == 'passenger'
      @wagons << wagon
    else
      puts "Неверный тип вагона!"
    end
  end
end
