# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Add multiple students to a course.
    #
    # Usage:
    #
    # ```ruby
    # api.addstudents.studentusernames(value).perform # returns string with raw output
    # # or
    # api.addstudents.studentusernames(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Addstudents < MediaWiktory::Wikipedia::Actions::Post

      # The usernames of the students to add to the course.
      #
      # @param values [Array<String>]
      # @return [self]
      def studentusernames(*values)
        values.inject(self) { |res, val| res._studentusernames(val) }
      end

      # @private
      def _studentusernames(value)
        merge(studentusernames: value.to_s, replace: false)
      end

      # The ID of the course to which the students should be added/removed.
      #
      # @param value [Integer]
      # @return [self]
      def courseid(value)
        merge(courseid: value.to_s)
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
end
