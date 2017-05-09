# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns all redirects to the given pages. 
    #
    # The "submodule" (MediaWiki API term) is included in action after setting some param, providing
    # additional tweaking for this param. Example (for {MediaWiktory::Wikipedia::Actions::Query} and
    # its submodules):
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Redirects

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "pageid" (Page ID of each redirect), "title" (Title of each redirect), "fragment" (Fragment of each redirect, if any).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res._prop(val) or fail ArgumentError, "Unknown value for prop: #{val}" }
      end

      # @private
      def _prop(value)
        defined?(super) && super || ["pageid", "title", "fragment"].include?(value.to_s) && merge(rdprop: value.to_s, replace: false)
      end

      # Only include pages in these namespaces.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res._namespace(val) or fail ArgumentError, "Unknown value for namespace: #{val}" }
      end

      # @private
      def _namespace(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(rdnamespace: value.to_s, replace: false)
      end

      # Show only items that meet these criteria:
      #
      # @param values [Array<String>] Allowed values: "fragment" (Only show redirects with a fragment), "!fragment" (Only show redirects without a fragment).
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res._show(val) or fail ArgumentError, "Unknown value for show: #{val}" }
      end

      # @private
      def _show(value)
        defined?(super) && super || ["fragment", "!fragment"].include?(value.to_s) && merge(rdshow: value.to_s, replace: false)
      end

      # How many redirects to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(rdlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(rdcontinue: value.to_s)
      end
    end
  end
end
