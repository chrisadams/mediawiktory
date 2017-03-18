module MediaWiktory
  class Userrights < Action
    symbol :userrights
    post!
    param :user, Params::String
    param :userid, Params::Integer
    param :add, Params::List[Params::Enum[:bot, :sysop, :bureaucrat, :reviewer, :steward, :accountcreator, :import, :transwiki, :"ipblock-exempt", :oversight, :founder, :rollbacker, :autoreviewer, :researcher, :filemover, :checkuser, :templateeditor, :"massmessage-sender", :extendedconfirmed, :extendedmover, :patroller, :abusefilter, :epcoordinator, :eponline, :epcampus, :epinstructor, :confirmed]]
    param :remove, Params::List[Params::Enum[:bot, :sysop, :bureaucrat, :reviewer, :steward, :accountcreator, :import, :transwiki, :"ipblock-exempt", :oversight, :founder, :rollbacker, :autoreviewer, :researcher, :filemover, :checkuser, :templateeditor, :"massmessage-sender", :extendedconfirmed, :extendedmover, :patroller, :abusefilter, :epcoordinator, :eponline, :epcampus, :epinstructor, :confirmed]]
    param :reason, Params::String
    param :token, Params::String
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
  end
end