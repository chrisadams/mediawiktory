# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get the localization of ULS in the given language.
    #
    # Usage:
    #
    # ```ruby
    # api.ulslocalization.language(value).perform # returns string with raw output
    # # or
    # api.ulslocalization.language(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Ulslocalization < MediaWiktory::Wikipedia::Actions::Get

      # Language code.
      #
      # @param value [String]
      # @return [self]
      def language(value)
        merge(language: value.to_s)
      end
    end
  end
end
