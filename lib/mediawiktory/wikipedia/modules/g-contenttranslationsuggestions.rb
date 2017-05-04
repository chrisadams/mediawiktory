# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GContenttranslationsuggestions

      # The source language code.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(gfrom: value.to_s)
      end

      # The target language code.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(gto: value.to_s)
      end

      # Return suggestions only from a particular list
      #
      # @param value [String]
      # @return [self]
      def listid(value)
        merge(glistid: value.to_s)
      end

      # The maximum number of translation suggestions to fetch.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(glimit: value.to_s)
      end

      # Offset for paginated results.
      #
      # @param value [String]
      # @return [self]
      def offset(value)
        merge(goffset: value.to_s)
      end

      # By default suggestions are returned in random order. If you wish to return each suggestion only once when using limit and offset, you must specify a seed for all the requests.
      #
      # @param value [Integer]
      # @return [self]
      def seed(value)
        merge(gseed: value.to_s)
      end
    end
  end
end
