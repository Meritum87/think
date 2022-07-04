class CargoWagon < Wagon

  def initialize(number_wagon, capacity)
    super
    @type_wagon = 'cargo'
  end

  def fill_volume(volume)
    if @capacity > @busy + volume
      @busy += volume
    else
      puts 'Недостаточно места!'
    end
  end
end
