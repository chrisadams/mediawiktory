module MediaWiktory::Wikipedia::Modules
  # Output data in serialized PHP format (pretty-print in HTML). 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.phpfm(**options).perform # returns string with raw output
  # # or
  # api.some_action.phpfm(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.phpfm.wrappedhtml(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Phpfm
    # Return the pretty-printed HTML and associated ResourceLoader modules as a JSON object.
    #
    # @return [self]
    def wrappedhtml()
      merge(wrappedhtml: 'true')
    end
    # Output formatting:
    #
    # @param value [String] One of "1" (Backwards-compatible format (XML-style booleans, * keys for content nodes, etc.)), "2" (Experimental modern format. Details may change!), "latest" (Use the latest format (currently 2), may change without warning).
    # @return [self]
    def formatversion(value)
      merge(formatversion: value.to_s)
    end
  end
end