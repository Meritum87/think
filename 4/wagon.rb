class Wagon
attr_reader :number_wagon, :type_wagon

  def initialize(number_wagon)
    @number_wagon = number_wagon
  end
end

class PassengerWagon < Wagon

  def initialize(number_wagon)
    super
    @type_wagon = 'passenger'
  end

end

class CargoWagon < Wagon

  def initialize(number_wagon)
    super
    @type_wagon = 'cargo'
  end

end
