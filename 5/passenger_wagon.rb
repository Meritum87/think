class PassengerWagon < Wagon

  def initialize(number_wagon, manufacturer_wagon)
    super
    @type_wagon = 'passenger'
  end
end
