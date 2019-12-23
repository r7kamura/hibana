require 'hibana/version'

module Hibana
  autoload :Application, 'hibana/application'
  autoload :Controller, 'hibana/controller'
  autoload :Errors, 'hibana/errors'
  autoload :View, 'hibana/view'

  class << self
    # @return [Hibana::Application]
    attr_accessor :application
  end
end
