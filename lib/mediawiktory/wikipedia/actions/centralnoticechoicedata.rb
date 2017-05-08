# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get data needed to choose a banner for a given project and language 
    #
    # Usage:
    #
    # ```ruby
    # api.centralnoticechoicedata.project(value).perform # returns string with raw output
    # # or
    # api.centralnoticechoicedata.project(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Centralnoticechoicedata < MediaWiktory::Wikipedia::Actions::Get

      # The project to get banner choice data for.
      #
      # @param value [String]
      # @return [self]
      def project(value)
        merge(project: value.to_s)
      end

      # The language to get banner choice data for.
      #
      # @param value [String]
      # @return [self]
      def language(value)
        merge(language: value.to_s)
      end
    end
  end
end
