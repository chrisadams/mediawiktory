# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Log in and get authentication cookies. 
    #
    # Usage:
    #
    # ```ruby
    # api.login(**options).perform # returns string with raw output
    # # or
    # api.login(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.login.name(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Login < MediaWiktory::Wikipedia::Actions::Post

      # User name.
      #
      # @param value [String]
      # @return [self]
      def name(value)
        merge(lgname: value.to_s)
      end

      # Password.
      #
      # @param value [String]
      # @return [self]
      def password(value)
        merge(lgpassword: value.to_s)
      end

      # Domain (optional).
      #
      # @param value [String]
      # @return [self]
      def domain(value)
        merge(lgdomain: value.to_s)
      end

      # A "login" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(lgtoken: value.to_s)
      end
    end
  end
end
