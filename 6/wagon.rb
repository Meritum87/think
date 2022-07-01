class Wagon
  include Manufacturer
  include Valid
  attr_reader :number_wagon, :type_wagon

  NUMBER_WAGON = /^\d{1,2}$/

  def initialize(number_wagon)
    @number_wagon = number_wagon
    validate!
  end

protected

  def validate!
    errors = []
    errors << "Не указан номер вагона!" if number_wagon.to_s.length < 0
    errors << "Номер вагона указан неверно!" if number_wagon !~ NUMBER_WAGON
    raise errors.join('.')unless errors.empty?
  end

end
