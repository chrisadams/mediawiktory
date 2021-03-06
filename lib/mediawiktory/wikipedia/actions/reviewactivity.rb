# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Advertise or de-advertise yourself as reviewing an unreviewed page or unreviewed changes.
    #
    # Usage:
    #
    # ```ruby
    # api.reviewactivity.previd(value).perform # returns string with raw output
    # # or
    # api.reviewactivity.previd(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Reviewactivity < MediaWiktory::Wikipedia::Actions::Post

      # The prior revision ID (for reviewing changes only).
      #
      # @param value [String]
      # @return [self]
      def previd(value)
        merge(previd: value.to_s)
      end

      # The ID of the revision being reviewed.
      #
      # @param value [String]
      # @return [self]
      def oldid(value)
        merge(oldid: value.to_s)
      end

      # Whether to advertise yourself as reviewing or no longer reviewing.
      #
      # @param value [String] One of "0", "1".
      # @return [self]
      def reviewing(value)
        _reviewing(value) or fail ArgumentError, "Unknown value for reviewing: #{value}"
      end

      # @private
      def _reviewing(value)
        defined?(super) && super || ["0", "1"].include?(value.to_s) && merge(reviewing: value.to_s)
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
