require './Chain'
require './NoticeHandler'
require './WarningHandler'
require './ErrorHandler'

chain = Chain.new()

begin
    chain.addToChain(NoticeHandler.new())
    chain.addToChain(WarningHandler.new())
    chain.addToChain(ErrorHandler.new())
    chain.execute("NoticeHandler")
    chain.execute("WarningHandler")
    chain.execute("ErrorHandler")
rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
end
