# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all transclusions (pages embedded using {{x}}), including non-existing. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Alltransclusions

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(atcontinue: value.to_s)
      end

      # The title of the transclusion to start enumerating from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(atfrom: value.to_s)
      end

      # The title of the transclusion to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(atto: value.to_s)
      end

      # Search for all transcluded titles that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(atprefix: value.to_s)
      end

      # Only show distinct transcluded titles. Cannot be used with atprop=ids. When used as a generator, yields target pages instead of source pages.
      #
      # @return [self]
      def unique()
        merge(atunique: 'true')
      end

      # Which pieces of information to include:
      #
      # @param values [Array<String>] Allowed values: "ids" (Adds the page ID of the transcluding page (cannot be used with atunique)), "title" (Adds the title of the transclusion).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["ids", "title"].include?(value.to_s) && merge(atprop: value.to_s)
      end

      # The namespace to enumerate.
      #
      # @param value [String] One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(value)
        defined?(super) && super || ["-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(atnamespace: value.to_s)
      end

      # How many total items to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(atlimit: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(atdir: value.to_s)
      end
    end
  end
end
