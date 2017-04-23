module MediaWiktory::Wikipedia::Actions
  # Email a user. 
  #
  # Usage:
  #
  # ```ruby
  # api.emailuser(**options).perform # returns string with raw output
  # # or
  # api.emailuser(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.emailuser.target(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Emailuser < MediaWiktory::GetAction
    # User to send email to.
    #
    # @param value [String]
    # @return [self]
    def target(value)
      merge(target: value.to_s)
    end
    # Subject header.
    #
    # @param value [String]
    # @return [self]
    def subject(value)
      merge(subject: value.to_s)
    end
    # Mail body.
    #
    # @param value [String]
    # @return [self]
    def text(value)
      merge(text: value.to_s)
    end
    # Send a copy of this mail to me.
    #
    # @return [self]
    def ccme()
      merge(ccme: 'true')
    end
    # A "csrf" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(token: value.to_s)
    end
  end
end