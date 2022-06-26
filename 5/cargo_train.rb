class CargoTrain < Train

  def add_wagon(wagon)
    if @speed == 0 && wagon.type_wagon == 'cargo'
      @wagons << wagon
    else
      puts "Неверный тип вагона!"
    end
  end
end
