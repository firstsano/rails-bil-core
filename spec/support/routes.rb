require 'active_support/concern'

module Routes
  module NamespaceHelpers
    extend ActiveSupport::Concern

    def namespaced(path)
      current_namespace + path
    end
  end
end
