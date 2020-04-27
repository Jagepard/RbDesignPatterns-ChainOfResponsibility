=begin
author  : Jagepard <jagepard@yandex.ru>
license https://mit-license.org/ MIT
=end

require "./NoticeHandler"
require "./WarningHandler"
require "./ErrorHandler"

notice = NoticeHandler.new

begin
    notice.set_next(WarningHandler.new).set_next(ErrorHandler.new)
    notice.execute("NoticeHandler")
    notice.execute("WarningHandler")
    notice.execute("ErrorHandler")
rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
end
