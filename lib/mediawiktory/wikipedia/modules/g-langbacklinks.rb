# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GLangbacklinks

      # Language for the language link.
      #
      # @param value [String]
      # @return [self]
      def lang(value)
        merge(glbllang: value.to_s)
      end

      # Language link to search for. Must be used with lbllang.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(glbltitle: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(glblcontinue: value.to_s)
      end

      # How many total pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(glbllimit: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        _dir(value) or fail ArgumentError, "Unknown value for dir: #{value}"
      end

      # @private
      def _dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(glbldir: value.to_s)
      end
    end
  end
end
