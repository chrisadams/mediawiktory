# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Lists the most viewed pages (based on last day's pageview count). 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Mostviewed

      # The metric to use for counting views. Depending on what backend is used, not all metrics might be supported. You can use the siteinfo API (action=query&meta=siteinfo) to check, under pageviewservice-supported-metrics / <module name>
      #
      # @param value [String] One of "pageviews" (Plain pageviews).
      # @return [self]
      def metric(value)
        _metric(value) or fail ArgumentError, "Unknown value for metric: #{value}"
      end

      # @private
      def _metric(value)
        defined?(super) && super || ["pageviews"].include?(value.to_s) && merge(pvimmetric: value.to_s)
      end

      # The number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(pvimlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(pvimoffset: value.to_s)
      end
    end
  end
end
