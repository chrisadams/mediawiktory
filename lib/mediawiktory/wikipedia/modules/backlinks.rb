# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Find all pages that link to the given page. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Backlinks

      # Title to search. Cannot be used together with blpageid.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(bltitle: value.to_s)
      end

      # Page ID to search. Cannot be used together with bltitle.
      #
      # @param value [Integer]
      # @return [self]
      def pageid(value)
        merge(blpageid: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(blcontinue: value.to_s)
      end

      # The namespace to enumerate.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res.namespace_single(val) }
      end

      # @private
      def namespace_single(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(blnamespace: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(bldir: value.to_s)
      end

      # How to filter for redirects. If set to nonredirects when blredirect is enabled, this is only applied to the second level.
      #
      # @param value [String] One of "all", "redirects", "nonredirects".
      # @return [self]
      def filterredir(value)
        defined?(super) && super || ["all", "redirects", "nonredirects"].include?(value.to_s) && merge(blfilterredir: value.to_s)
      end

      # How many total pages to return. If blredirect is enabled, the limit applies to each level separately (which means up to 2 * bllimit results may be returned).
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(bllimit: value.to_s)
      end

      # If linking page is a redirect, find all pages that link to that redirect as well. Maximum limit is halved.
      #
      # @return [self]
      def redirect()
        merge(blredirect: 'true')
      end
    end
  end
end
