module Finder
  def self.included(base)
#    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.send :before_filter, :init
  end

  module InstanceMethods

    def init
      params.each { |key, value| 
                  if key == "id"
                    model_name = self.class.to_s.chomp("sController")
                    var_name = "@" + model_name.downcase
                    begin
                      instance_variable_set(var_name, eval(model_name).find_by_id(value))
                    rescue
                      instance_variable_set(var_name, nil)
                    end
                  elsif key =~ /_id$/
                    model_name = key.chomp("_id").capitalize
                    var_name = key.chomp("_id")
                    begin
                      instance_variable_set(var_name, eval(model_name).find_by_id(value))
                    rescue
                      instance_variable_set(var_name, nil)
                    end
                  end
                } 
    end
  end

#  module ClassMethods
#  end
end