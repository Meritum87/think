class CargoTrain < Train

  def add_wagon(wagon, manufacturer_train)
    if @speed == 0 && wagon.type_wagon == 'cargo'
      @wagons << wagon
    else
      puts "Неверный тип вагона!"
    end
  end
end
