require 'kuby/version'
require 'kuby/link'

module Kuby
  class UnsupportedTelemachusVersion < StandardError; end
  class ConnectionNotEstablished < StandardError; end
  class TelemachusConnectionRefused < StandardError; end
end
