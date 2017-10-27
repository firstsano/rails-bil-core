module Sequel
  class Model
    singleton_class.send :alias_method, :cache_key, :to_param
  end
end
