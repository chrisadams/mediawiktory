# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Change the protection level of a page. 
    #
    # Usage:
    #

    # ```ruby
    # api.protect(**options).perform # returns string with raw output
    # # or
    # api.protect(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.protect.title(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Protect < MediaWiktory::Wikipedia::Actions::Post

      # Title of the page to (un)protect. Cannot be used together with pageid.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(title: value.to_s)
      end

      # ID of the page to (un)protect. Cannot be used together with title.
      #
      # @param value [Integer]
      # @return [self]
      def pageid(value)
        merge(pageid: value.to_s)
      end

      # List of protection levels, formatted action=level (e.g. edit=sysop). A level of all means everyone is allowed to take the action, i.e. no restriction.
      #
      # @param values [Array<String>]
      # @return [self]
      def protections(*values)
        values.inject(self) { |res, val| res.protections_single(val) }
      end

      # @private
      def protections_single(value)
        merge(protections: value.to_s)
      end

      # Expiry timestamps. If only one timestamp is set, it'll be used for all protections. Use infinite, indefinite, infinity, or never, for a never-expiring protection.
      #
      # @param values [Array<String>]
      # @return [self]
      def expiry(*values)
        values.inject(self) { |res, val| res.expiry_single(val) }
      end

      # @private
      def expiry_single(value)
        merge(expiry: value.to_s)
      end

      # Reason for (un)protecting.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(reason: value.to_s)
      end

      # Change tags to apply to the entry in the protection log.
      #
      # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
      # @return [self]
      def tags(*values)
        values.inject(self) { |res, val| res.tags_single(val) }
      end

      # @private
      def tags_single(value)
        defined?(super) && super || ["ProveIt edit", "WPCleaner", "huggle", "large plot addition"].include?(value.to_s) && merge(tags: value.to_s)
      end

      # Enable cascading protection (i.e. protect transcluded templates and images used in this page). Ignored if none of the given protection levels support cascading.
      #
      # @return [self]
      def cascade()
        merge(cascade: 'true')
      end

      # If set, add the page being (un)protected to the current user's watchlist.
      #
      # @return [self]
      def watch()
        merge(watch: 'true')
      end

      # Unconditionally add or remove the page from the current user's watchlist, use preferences or do not change watch.
      #
      # @param value [String] One of "watch", "unwatch", "preferences", "nochange".
      # @return [self]
      def watchlist(value)
        defined?(super) && super || ["watch", "unwatch", "preferences", "nochange"].include?(value.to_s) && merge(watchlist: value.to_s)
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
