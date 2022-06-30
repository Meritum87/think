module InstanceCounter

@@instance = 0

  def self.included(base)
    base.extend ClassMethods
    base.include InstansMethods
  end

  module ClassMethods

    def instances
      @@instance
    end

    def increase_instance
      @@instance += 1
    end
  end

  module InstansMethods

protected

    def register_instance
      self.class.increase_instance
    end
  end
end
