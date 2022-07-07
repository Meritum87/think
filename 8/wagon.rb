# work with Wagon class
class Wagon
  include Manufacturer
  include Valid
  attr_reader :number_wagon, :type_wagon, :capacity
  attr_accessor :busy

  NUMBER_WAGON = /^\d{1,2}$/

  def initialize(number_wagon, capacity)
    @number_wagon = number_wagon
    @capacity = capacity
    @busy = 0
    validate!
  end

  def total_occupied
    @busy
  end

  def free_places
    @capacity - @busy
  end

  protected

  def validate!
    errors = []
    errors << 'Не указан номер вагона!' if number_wagon.to_s.length < 0
    errors << 'Номер вагона указан неверно!' if number_wagon !~ NUMBER_WAGON
    raise errors.join('.') unless errors.empty?
  end
end
