# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # The module is included in action after setting some param, providing additional tweaking for
    # this param. Example:
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GQuerypage

      # The name of the special page. Note, this is case sensitive.
      #
      # @param value [String] One of "Ancientpages", "BrokenRedirects", "Deadendpages", "DoubleRedirects", "ListDuplicatedFiles", "Listredirects", "Lonelypages", "Longpages", "MediaStatistics", "Mostcategories", "Mostimages", "Mostinterwikis", "Mostlinkedcategories", "Mostlinkedtemplates", "Mostlinked", "Mostrevisions", "Fewestrevisions", "Shortpages", "Uncategorizedcategories", "Uncategorizedpages", "Uncategorizedimages", "Uncategorizedtemplates", "Unusedcategories", "Unusedimages", "Wantedcategories", "Wantedfiles", "Wantedpages", "Wantedtemplates", "Unwatchedpages", "Unusedtemplates", "Withoutinterwiki", "UnconnectedPages", "PagesWithBadges", "EntityUsage", "GadgetUsage", "MostGloballyLinkedFiles", "GloballyWantedFiles", "DisambiguationPages", "DisambiguationPageLinks".
      # @return [self]
      def page(value)
        _page(value) or fail ArgumentError, "Unknown value for page: #{value}"
      end

      # @private
      def _page(value)
        defined?(super) && super || ["Ancientpages", "BrokenRedirects", "Deadendpages", "DoubleRedirects", "ListDuplicatedFiles", "Listredirects", "Lonelypages", "Longpages", "MediaStatistics", "Mostcategories", "Mostimages", "Mostinterwikis", "Mostlinkedcategories", "Mostlinkedtemplates", "Mostlinked", "Mostrevisions", "Fewestrevisions", "Shortpages", "Uncategorizedcategories", "Uncategorizedpages", "Uncategorizedimages", "Uncategorizedtemplates", "Unusedcategories", "Unusedimages", "Wantedcategories", "Wantedfiles", "Wantedpages", "Wantedtemplates", "Unwatchedpages", "Unusedtemplates", "Withoutinterwiki", "UnconnectedPages", "PagesWithBadges", "EntityUsage", "GadgetUsage", "MostGloballyLinkedFiles", "GloballyWantedFiles", "DisambiguationPages", "DisambiguationPageLinks"].include?(value.to_s) && merge(gqppage: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(gqpoffset: value.to_s)
      end

      # Number of results to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gqplimit: value.to_s)
      end
    end
  end
end
