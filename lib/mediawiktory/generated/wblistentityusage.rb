module MediaWiktory
  class Wblistentityusage < MWModule
    symbol :wblistentityusage
    prefix "wbeu"
    param :prop, Params::List[Params::Enum[:url]]
    param :aspect, Params::List[Params::Enum[:S, :L, :T, :X, :O]]
    param :entities, Params::List[Params::String]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
  end
end