# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all page property names in use on the wiki. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Pagepropnames

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(ppncontinue: value.to_s)
      end

      # The maximum number of names to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(ppnlimit: value.to_s)
      end
    end
  end
end
