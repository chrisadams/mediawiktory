# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Return meta information about image repositories configured on the wiki. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Filerepoinfo

      # Which repository properties to get (there may be more available on some wikis):
      #
      # @param values [Array<String>] Allowed values: "apiurl" (URL to the repository API - helpful for getting image info from the host), "name" (The key of the repository - used in e.g. $wgForeignFileRepos and imageinfo return values), "displayname" (The human-readable name of the repository wiki), "rooturl" (Root URL for image paths), "local" (Whether that repository is the local one or not).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["apiurl", "name", "displayname", "rooturl", "local"].include?(value.to_s) && merge(friprop: value.to_s)
      end
    end
  end
end
