# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Clears the hasmsg flag for the current user.
    #
    # Usage:
    #
    # ```ruby
    # api.clearhasmsg.perform # returns string with raw output
    # # or
    # api.clearhasmsg.response # returns output parsed and wrapped into Mash-like object
    # ```
    #
    # This action has no parameters.
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Clearhasmsg < MediaWiktory::Wikipedia::Actions::Post
    end
  end
end
