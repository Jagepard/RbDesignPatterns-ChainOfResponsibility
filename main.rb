=begin
author  : Jagepard <jagepard@yandex.ru>
license https://mit-license.org/ MIT
=end

require './Chain'
require './NoticeHandler'
require './WarningHandler'
require './ErrorHandler'

notice = NoticeHandler.new()

begin
    notice.setNext(WarningHandler.new()).setNext(ErrorHandler.new())
    notice.execute("NoticeHandler")
    notice.execute("WarningHandler")
    notice.execute("ErrorHandler")
rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
end
