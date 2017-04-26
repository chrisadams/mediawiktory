# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.exturlusage(**options).perform # returns string with raw output
    # # or
    # api.some_action.exturlusage(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.exturlusage.offset(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GExturlusage

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(geuoffset: value.to_s)
      end

      # Protocol of the URL. If empty and euquery is set, the protocol is http. Leave both this and euquery empty to list all external links.
      #
      # @param value [String] One of "bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp".
      # @return [self]
      def protocol(value)
        merge(geuprotocol: value.to_s)
      end

      # Search string without protocol. See Special:LinkSearch. Leave empty to list all external links.
      #
      # @param value [String]
      # @return [self]
      def query(value)
        merge(geuquery: value.to_s)
      end

      # The page namespaces to enumerate.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(geunamespace: values.join('|'))
      end

      # How many pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(geulimit: value.to_s)
      end

      # Expand protocol-relative URLs with the canonical protocol.
      #
      # @return [self]
      def expandurl()
        merge(geuexpandurl: 'true')
      end
  end
  end
end