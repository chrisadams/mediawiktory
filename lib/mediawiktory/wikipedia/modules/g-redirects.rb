# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.redirects(**options).perform # returns string with raw output
    # # or
    # api.some_action.redirects(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.redirects.namespace(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GRedirects

      # Only include pages in these namespaces.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(grdnamespace: values.join('|'))
      end

      # Show only items that meet these criteria:
      #
      # @param values [Array<String>] Allowed values: "fragment" (Only show redirects with a fragment), "!fragment" (Only show redirects without a fragment).
      # @return [self]
      def show(*values)
        merge(grdshow: values.join('|'))
      end

      # How many redirects to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(grdlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(grdcontinue: value.to_s)
      end
    end
  end
end
