class CargoWagon < Wagon

  def initialize(number_wagon, manufacturer_wagon)
    super
    @type_wagon = 'cargo'
  end
end
