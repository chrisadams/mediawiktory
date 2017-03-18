module MediaWiktory
  class Tag < Action
    symbol :tag
    post!
    param :rcid, Params::List[Params::Integer]
    param :revid, Params::List[Params::Integer]
    param :logid, Params::List[Params::Integer]
    param :add, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :remove, Params::List[Params::String]
    param :reason, Params::String
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :token, Params::String
  end
end