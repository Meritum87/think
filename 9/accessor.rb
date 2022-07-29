# Creating getters and setters for attributes
module Accessor
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        variable_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(variable_name) }
        define_method("@#{name}=".to_sym) do |meaning|
          instance_variable_set(variable_name, meaning)
          instance_variable_get("@#{name}"_history) << instance_variable_get(variable_name)
        end
      end
      define_method("#{name}_history".to_sym) do
        instance_variable_get("#{name}"_history) }
      end
    end

    def strong_atter_accessor(name, class_name)
      variable_name = "@#{name}".to_sym
      class_name.capitalize!
      define_method(name) { instance_variable_get(variable_name) }

      reise 'Несовпадение с классом' unless variable_name.is_a?(class_name)
      define_method("@#{name}=".to_sym) do
        instance_variable_set(variable_name, class_name)
      end
    end
  end
end
