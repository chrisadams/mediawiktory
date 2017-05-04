# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Performs data validation for Kartographer extension 
    #
    # Usage:
    #

    # ```ruby
    # api.sanitize-mapdata(**options).perform # returns string with raw output
    # # or
    # api.sanitize-mapdata(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.sanitize-mapdata.title(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class SanitizeMapdata < MediaWiktory::Wikipedia::Actions::Post

      # Title of page on which this GeoJSON is supposed to be located. If no title is provided, a dummy one will be used.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(title: value.to_s)
      end

      # GeoJSON to sanitize
      #
      # @param value [String]
      # @return [self]
      def text(value)
        merge(text: value.to_s)
      end
    end
  end
end
