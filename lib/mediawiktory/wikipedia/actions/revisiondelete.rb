# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Delete and undelete revisions. 
    #
    # Usage:
    #

    # ```ruby
    # api.revisiondelete(**options).perform # returns string with raw output
    # # or
    # api.revisiondelete(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.revisiondelete.type(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Revisiondelete < MediaWiktory::Wikipedia::Actions::Post

      # Type of revision deletion being performed.
      #
      # @param value [String] One of "revision", "archive", "oldimage", "filearchive", "logging".
      # @return [self]
      def type(value)
        defined?(super) && super || ["revision", "archive", "oldimage", "filearchive", "logging"].include?(value.to_s) && merge(type: value.to_s)
      end

      # Page title for the revision deletion, if required for the type.
      #
      # @param value [String]
      # @return [self]
      def target(value)
        merge(target: value.to_s)
      end

      # Identifiers for the revisions to be deleted.
      #
      # @param values [Array<String>]
      # @return [self]
      def ids(*values)
        values.inject(self) { |res, val| res.ids_single(val) }
      end

      protected def ids_single(value)
        merge(ids: value.to_s)
      end

      # What to hide for each revision.
      #
      # @param values [Array<String>] Allowed values: "content", "comment", "user".
      # @return [self]
      def hide(*values)
        values.inject(self) { |res, val| res.hide_single(val) }
      end

      protected def hide_single(value)
        defined?(super) && super || ["content", "comment", "user"].include?(value.to_s) && merge(hide: value.to_s)
      end

      # What to unhide for each revision.
      #
      # @param values [Array<String>] Allowed values: "content", "comment", "user".
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res.show_single(val) }
      end

      protected def show_single(value)
        defined?(super) && super || ["content", "comment", "user"].include?(value.to_s) && merge(show: value.to_s)
      end

      # Whether to suppress data from administrators as well as others.
      #
      # @param value [String] One of "yes", "no", "nochange".
      # @return [self]
      def suppress(value)
        defined?(super) && super || ["yes", "no", "nochange"].include?(value.to_s) && merge(suppress: value.to_s)
      end

      # Reason for the deletion or undeletion.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(reason: value.to_s)
      end

      # Tags to apply to the entry in the deletion log.
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
