# Implementation module Validation
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstancMethods
  end

  module ClassMethods
    def validate(name, type, *options)
      @validate = []
      @validate << {name: name, type: type, options: options}
    end
  end

  module InstancMethods
    def validate!
      self.class.instance_variable_get("@validate").each do |hash|
        name = hash[:name]
        type = hash[:type]
        options = hash[:options]
        meaning = instance_variable_get("@#{name}")
        send("validate_#{type}", name, meaning, options)
      end
    end

    def validate_presence(name, meaning)
      reise "Error validate presence!" if meaning.nil? || meaning.empty?
    end

    def validate_format(name, meaning, format)
      reise "Error validate format!" if meaning !~ format
    end

    def validate_type(name, meaning, type)
      reise "Error validate type!" if unless meaning.is_a?(type)
    end

    def valid?
      validate!
      true
    rescue
      false
    end
  end
end
