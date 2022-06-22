class Wagon
include Manufacturer
attr_reader :number_wagon, :type_wagon

  def initialize(number_wagon, manufacturer_wagon)
    @number_wagon = number_wagon
    @manufacturer_wagon = manufacturer_wagon
  end
end
