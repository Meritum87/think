class PassengerWagon < Wagon

  def initialize(number_wagon, capacity)
    super
    @type_wagon = 'passenger'
  end

  def take_seat
    if @capacity > @busy
      @busy += 1
    else
      puts 'Нет свободных мест!'
    end
  end
end
