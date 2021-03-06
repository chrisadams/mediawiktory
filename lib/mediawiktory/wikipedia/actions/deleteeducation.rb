# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Delete Education Program objects.
    #
    # Usage:
    #
    # ```ruby
    # api.deleteeducation.ids(value).perform # returns string with raw output
    # # or
    # api.deleteeducation.ids(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Deleteeducation < MediaWiktory::Wikipedia::Actions::Post

      # The IDs of the objects to delete.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def ids(*values)
        values.inject(self) { |res, val| res._ids(val) }
      end

      # @private
      def _ids(value)
        merge(ids: value.to_s, replace: false)
      end

      # Type of object to delete.
      #
      # @param value [String] One of "org", "course".
      # @return [self]
      def type(value)
        _type(value) or fail ArgumentError, "Unknown value for type: #{value}"
      end

      # @private
      def _type(value)
        defined?(super) && super || ["org", "course"].include?(value.to_s) && merge(type: value.to_s)
      end

      # Reason for this deletion, for the log.
      #
      # @param value [String]
      # @return [self]
      def comment(value)
        merge(comment: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
