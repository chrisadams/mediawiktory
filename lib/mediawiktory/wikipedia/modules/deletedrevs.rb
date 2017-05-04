# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List deleted revisions. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Deletedrevs

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(drstart: value.iso8601)
      end

      # The timestamp to stop enumerating at.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(drend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: drstart has to be before drend), "older" (List newest first (default). Note: drstart has to be later than drend).
      # @return [self]
      def dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(drdir: value.to_s)
      end

      # Start listing at this title.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(drfrom: value.to_s)
      end

      # Stop listing at this title.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(drto: value.to_s)
      end

      # Search for all page titles that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(drprefix: value.to_s)
      end

      # List only one revision for each page.
      #
      # @return [self]
      def unique()
        merge(drunique: 'true')
      end

      # Only list pages in this namespace.
      #
      # @param value [String] One of "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(drnamespace: value.to_s)
      end

      # Only list revisions tagged with this tag.
      #
      # @param value [String]
      # @return [self]
      def tag(value)
        merge(drtag: value.to_s)
      end

      # Only list revisions by this user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(druser: value.to_s)
      end

      # Don't list revisions by this user.
      #
      # @param value [String]
      # @return [self]
      def excludeuser(value)
        merge(drexcludeuser: value.to_s)
      end

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "revid" (Adds the revision ID of the deleted revision), "parentid" (Adds the revision ID of the previous revision to the page), "user" (Adds the user who made the revision), "userid" (Adds the ID of the user who made the revision), "comment" (Adds the comment of the revision), "parsedcomment" (Adds the parsed comment of the revision), "minor" (Tags if the revision is minor), "len" (Adds the length (bytes) of the revision), "sha1" (Adds the SHA-1 (base 16) of the revision), "content" (Adds the content of the revision), "token" (Deprecated. Gives the edit token), "tags" (Tags for the revision).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["revid", "parentid", "user", "userid", "comment", "parsedcomment", "minor", "len", "sha1", "content", "token", "tags"].include?(value.to_s) && merge(drprop: value.to_s)
      end

      # The maximum amount of revisions to list.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(drlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(drcontinue: value.to_s)
      end
    end
  end
end
