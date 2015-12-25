require 'japi/version'
require 'japi/trebek'
require 'japi/category'
require 'japi/clue'

# namespace for JAPI, holds Clue, Category, Trebek, etc...
#
# @author Dean Silfen
module JAPI
  require 'configurations'
  require 'open-uri'
  require 'json'
  require 'uri'

  # Exception for attempting to pass illegal params to the API
  #
  # @author Dean Silfen
  class InvalidParamError < StandardError; end

  include Configurations
  configurable String, :jservice_url
  configuration_defaults do |config|
    config.jservice_url = "http://jservice.io/api/"
  end
end

