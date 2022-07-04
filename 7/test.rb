class Wagon
  attr_reader :number_wagon, :capacity
  attr_accessor :busy

  def initialize(number_wagon, capacity)
    @number_wagon = number_wagon
    @capacity = capacity
    @busy = 0
  end

  def take_seat
    if @capacity > @busy
      @busy += 1
    else
      puts 'Нет свободных мест!'
    end
  end

  def total_occupied
    @busy
  end

  def free_places
    @capacity - @busy
  end
end
