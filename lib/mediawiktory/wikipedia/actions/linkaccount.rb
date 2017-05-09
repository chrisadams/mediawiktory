# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Link an account from a third-party provider to the current user. 
    #
    # Usage:
    #
    # ```ruby
    # api.linkaccount.requests(value).perform # returns string with raw output
    # # or
    # api.linkaccount.requests(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Linkaccount < MediaWiktory::Wikipedia::Actions::Post

      # Only use these authentication requests, by the id returned from action=query&meta=authmanagerinfo with amirequestsfor=link or from a previous response from this module.
      #
      # @param values [Array<String>]
      # @return [self]
      def requests(*values)
        values.inject(self) { |res, val| res._requests(val) }
      end

      # @private
      def _requests(value)
        merge(linkrequests: value.to_s, replace: false)
      end

      # Format to use for returning messages.
      #
      # @param value [String] One of "html", "wikitext", "raw", "none".
      # @return [self]
      def messageformat(value)
        _messageformat(value) or fail ArgumentError, "Unknown value for messageformat: #{value}"
      end

      # @private
      def _messageformat(value)
        defined?(super) && super || ["html", "wikitext", "raw", "none"].include?(value.to_s) && merge(linkmessageformat: value.to_s)
      end

      # Merge field information for all authentication requests into one array.
      #
      # @return [self]
      def mergerequestfields()
        merge(linkmergerequestfields: 'true')
      end

      # Return URL for third-party authentication flows, must be absolute. Either this or linkcontinue is required.
      #
      # @param value [String]
      # @return [self]
      def returnurl(value)
        merge(linkreturnurl: value.to_s)
      end

      # This request is a continuation after an earlier UI or REDIRECT response. Either this or linkreturnurl is required.
      #
      # @return [self]
      def continue()
        merge(linkcontinue: 'true')
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(linktoken: value.to_s)
      end
    end
  end
end
