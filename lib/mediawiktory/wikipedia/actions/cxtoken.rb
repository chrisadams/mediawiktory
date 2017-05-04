# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get JWT tokens to authenticate with cxserver. 
    #
    # Usage:
    #
    # ```ruby
    # api.cxtoken(**options).perform # returns string with raw output
    # # or
    # api.cxtoken(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.cxtoken.token(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxtoken < MediaWiktory::Wikipedia::Actions::Post

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
