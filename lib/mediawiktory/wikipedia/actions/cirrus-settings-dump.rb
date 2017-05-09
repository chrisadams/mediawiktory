# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Dump of CirrusSearch settings for this wiki.
    #
    # Usage:
    #
    # ```ruby
    # api.cirrus-settings-dump.perform # returns string with raw output
    # # or
    # api.cirrus-settings-dump.response # returns output parsed and wrapped into Mash-like object
    # ```
    #
    # This action has no parameters.
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class CirrusSettingsDump < MediaWiktory::Wikipedia::Actions::Get
    end
  end
end
