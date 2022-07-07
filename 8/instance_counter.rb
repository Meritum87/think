# implementation of automatic method connection
module InstanceCounter
  @@instance = 0

  def self.included(base)
    base.extend ClassMethods
    base.include InstansMethods
  end

  # implementation of returning the number of class instances
  module ClassMethods
    def instances
      @@instance
    end

    def increase_instance
      @@instance += 1
    end
  end

  # implementation of counter of class instance
  module InstansMethods
    protected

    def register_instance
      self.class.increase_instance
    end
  end
end
