# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GCategories

      # Which kind of categories to show.
      #
      # @param values [Array<String>] Allowed values: "hidden", "!hidden".
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res._show(val) or fail ArgumentError, "Unknown value for show: #{val}" }
      end

      # @private
      def _show(value)
        defined?(super) && super || ["hidden", "!hidden"].include?(value.to_s) && merge(gclshow: value.to_s)
      end

      # How many categories to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gcllimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gclcontinue: value.to_s)
      end

      # Only list these categories. Useful for checking whether a certain page is in a certain category.
      #
      # @param values [Array<String>]
      # @return [self]
      def categories(*values)
        values.inject(self) { |res, val| res._categories(val) }
      end

      # @private
      def _categories(value)
        merge(gclcategories: value.to_s)
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
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(gcldir: value.to_s)
      end
    end
  end
end
