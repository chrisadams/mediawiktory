# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns information about images on the page, such as thumbnail and presence of photos. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Pageimages

      # Which information to return:
      #
      # @param values [Array<String>] Allowed values: "thumbnail" (URL and dimensions of thumbnail image associated with page, if any), "original" (URL and original dimensions of image associated with page, if any), "name" (Image title).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["thumbnail", "original", "name"].include?(value.to_s) && merge(piprop: value.to_s)
      end

      # Maximum thumbnail dimension.
      #
      # @param value [Integer]
      # @return [self]
      def thumbsize(value)
        merge(pithumbsize: value.to_s)
      end

      # Properties of how many pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(pilimit: value.to_s)
      end

      # Limit page images to a certain license type
      #
      # @param value [String] One of "free", "any".
      # @return [self]
      def license(value)
        defined?(super) && super || ["free", "any"].include?(value.to_s) && merge(pilicense: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def continue(value)
        merge(picontinue: value.to_s)
      end
    end
  end
end
