require "japi/version"
require "japi/trebek"
require "japi/category"
require "japi/clue"


# @author Dean Silfen
# @abstract namespace for JAPI, holds Clue, Category, Trebek, etc...
module JAPI
  require "open-uri"
  require 'json'
  require 'uri'

  # @author Dean Silfen
  # @abstract Exception for attempting to pass illegal params to the API etc...
  class InvalidParamError < StandardError; end
end

