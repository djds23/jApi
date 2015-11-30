require "japi/version"
require "japi/trebek"
require "japi/category"
require "japi/clue"

# namespace for JAPI, holds Clue, Category, Trebek, etc...
#
# @author Dean Silfen
module JAPI
  require "open-uri"
  require 'json'
  require 'uri'

  # Exception for attempting to pass illegal params to the API etc...
  #
  # @author Dean Silfen
  class InvalidParamError < StandardError; end
end

