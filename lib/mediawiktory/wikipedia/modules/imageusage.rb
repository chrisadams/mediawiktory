# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Find all pages that use the given image title.
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
    module Imageusage

      # Title to search. Cannot be used together with iupageid.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(iutitle: value.to_s)
      end

      # Page ID to search. Cannot be used together with iutitle.
      #
      # @param value [Integer]
      # @return [self]
      def pageid(value)
        merge(iupageid: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(iucontinue: value.to_s)
      end

      # The namespace to enumerate.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res._namespace(val) or fail ArgumentError, "Unknown value for namespace: #{val}" }
      end

      # @private
      def _namespace(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(iunamespace: value.to_s, replace: false)
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
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(iudir: value.to_s)
      end

      # How to filter for redirects. If set to nonredirects when iuredirect is enabled, this is only applied to the second level.
      #
      # @param value [String] One of "all", "redirects", "nonredirects".
      # @return [self]
      def filterredir(value)
        _filterredir(value) or fail ArgumentError, "Unknown value for filterredir: #{value}"
      end

      # @private
      def _filterredir(value)
        defined?(super) && super || ["all", "redirects", "nonredirects"].include?(value.to_s) && merge(iufilterredir: value.to_s)
      end

      # How many total pages to return. If iuredirect is enabled, the limit applies to each level separately (which means up to 2 * iulimit results may be returned).
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(iulimit: value.to_s)
      end

      # If linking page is a redirect, find all pages that link to that redirect as well. Maximum limit is halved.
      #
      # @return [self]
      def redirect()
        merge(iuredirect: 'true')
      end
    end
  end
end
