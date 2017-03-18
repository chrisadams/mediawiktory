module MediaWiktory
  class Delete < Action
    symbol :delete
    post!
    param :title, Params::String
    param :pageid, Params::Integer
    param :reason, Params::String
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :watch, Params::Boolean
    param :watchlist, Params::Enum[:watch, :unwatch, :preferences, :nochange]
    param :unwatch, Params::Boolean
    param :oldimage, Params::String
    param :token, Params::String
  end
end