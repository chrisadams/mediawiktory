# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all titles protected from creation. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Protectedtitles

      # Only list titles in these namespaces.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res.namespace_single(val) }
      end

      # @private
      def namespace_single(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(ptnamespace: value.to_s)
      end

      # Only list titles with these protection levels.
      #
      # @param values [Array<String>] Allowed values: "autoconfirmed", "extendedconfirmed", "templateeditor", "sysop".
      # @return [self]
      def level(*values)
        values.inject(self) { |res, val| res.level_single(val) }
      end

      # @private
      def level_single(value)
        defined?(super) && super || ["autoconfirmed", "extendedconfirmed", "templateeditor", "sysop"].include?(value.to_s) && merge(ptlevel: value.to_s)
      end

      # How many total pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(ptlimit: value.to_s)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: ptstart has to be before ptend), "older" (List newest first (default). Note: ptstart has to be later than ptend).
      # @return [self]
      def dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(ptdir: value.to_s)
      end

      # Start listing at this protection timestamp.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(ptstart: value.iso8601)
      end

      # Stop listing at this protection timestamp.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(ptend: value.iso8601)
      end

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "timestamp" (Adds the timestamp of when protection was added), "user" (Adds the user that added the protection), "userid" (Adds the user ID that added the protection), "comment" (Adds the comment for the protection), "parsedcomment" (Adds the parsed comment for the protection), "expiry" (Adds the timestamp of when the protection will be lifted), "level" (Adds the protection level).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["timestamp", "user", "userid", "comment", "parsedcomment", "expiry", "level"].include?(value.to_s) && merge(ptprop: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(ptcontinue: value.to_s)
      end
    end
  end
end
