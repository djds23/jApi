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

  # Exception for attempting to pass invalid url to the JAPI configuration
  #
  # @author Dean Silfen
  class InvalidURLError < StandardError; end


  include Configurations
  configurable String, :jservice_url do |value|
    unless value =~ /\A#{URI::regexp(['http', 'https'])}\z/
      raise InvalidURLError, "jservice_url must be a valid URL, #{value} does not appear valid to URI::regexp"
    end
  end

  configuration_defaults do |config|
    config.jservice_url = "http://jservice.io/api/"
  end
end

