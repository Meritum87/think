class Wagon
  include Manufacturer
  attr_reader :number_wagon, :type_wagon

  NUMBER_WAGON = /^\d{1,2}$/

  def initialize(number_wagon)
    @number_wagon = number_wagon
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

protected

  def validate!
    raise "Не указан номер вагона!" if number_wagon.to_s.length < 0
    raise "Номер вагона указан неверно!" if number_wagon !~ NUMBER_WAGON
    true
  end
end
