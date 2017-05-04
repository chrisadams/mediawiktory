# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Unblock a user. 
    #
    # Usage:
    #

    # ```ruby
    # api.unblock(**options).perform # returns string with raw output
    # # or
    # api.unblock(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.unblock.id(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Unblock < MediaWiktory::Wikipedia::Actions::Post

      # ID of the block to unblock (obtained through list=blocks). Cannot be used together with user or userid.
      #
      # @param value [Integer]
      # @return [self]
      def id(value)
        merge(id: value.to_s)
      end

      # Username, IP address or IP address range to unblock. Cannot be used together with id or userid.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(user: value.to_s)
      end

      # User ID to unblock. Cannot be used together with id or user.
      #
      # @param value [Integer]
      # @return [self]
      def userid(value)
        merge(userid: value.to_s)
      end

      # Reason for unblock.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(reason: value.to_s)
      end

      # Change tags to apply to the entry in the block log.
      #
      # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
      # @return [self]
      def tags(*values)
        values.inject(self) { |res, val| res.tags_single(val) }
      end

      protected def tags_single(value)
        defined?(super) && super || ["ProveIt edit", "WPCleaner", "huggle", "large plot addition"].include?(value.to_s) && merge(tags: value.to_s)
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
