# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns pages having coordinates that are located in a certain area. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Geosearch

      # Coordinate around which to search.
      #
      # @param value [String]
      # @return [self]
      def coord(value)
        merge(gscoord: value.to_s)
      end

      # Title of page around which to search.
      #
      # @param value [String]
      # @return [self]
      def page(value)
        merge(gspage: value.to_s)
      end

      # Bounding box to search in: pipe (|) separated coordinates of top left and bottom right corners.
      #
      # @param value [String]
      # @return [self]
      def bbox(value)
        merge(gsbbox: value.to_s)
      end

      # Search radius in meters.
      #
      # @param value [Integer]
      # @return [self]
      def radius(value)
        merge(gsradius: value.to_s)
      end

      # Restrict search to objects no larger than this, in meters.
      #
      # @param value [Integer]
      # @return [self]
      def maxdim(value)
        merge(gsmaxdim: value.to_s)
      end

      # Maximum number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gslimit: value.to_s)
      end

      # Globe to search on (by default "earth").
      #
      # @param value [String] One of "earth".
      # @return [self]
      def globe(value)
        _globe(value) or fail ArgumentError, "Unknown value for globe: #{value}"
      end

      # @private
      def _globe(value)
        defined?(super) && super || ["earth"].include?(value.to_s) && merge(gsglobe: value.to_s)
      end

      # Namespaces to search.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res._namespace(val) or fail ArgumentError, "Unknown value for namespace: #{val}" }
      end

      # @private
      def _namespace(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(gsnamespace: value.to_s)
      end

      # Which additional coordinate properties to return.
      #
      # @param values [Array<String>] Allowed values: "type", "name", "dim", "country", "region", "globe".
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res._prop(val) or fail ArgumentError, "Unknown value for prop: #{val}" }
      end

      # @private
      def _prop(value)
        defined?(super) && super || ["type", "name", "dim", "country", "region", "globe"].include?(value.to_s) && merge(gsprop: value.to_s)
      end

      # Whether to return only primary coordinates ("primary"), secondary ("secondary") or both ("all").
      #
      # @param value [String] One of "primary", "secondary", "all".
      # @return [self]
      def primary(value)
        _primary(value) or fail ArgumentError, "Unknown value for primary: #{value}"
      end

      # @private
      def _primary(value)
        defined?(super) && super || ["primary", "secondary", "all"].include?(value.to_s) && merge(gsprimary: value.to_s)
      end

      # Whether debug information should be returned.
      #
      # @return [self]
      def debug()
        merge(gsdebug: 'true')
      end
    end
  end
end
