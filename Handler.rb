=begin
author  : Jagepard <jagepard@yandex.ru>
license https://mit-license.org/ MIT
=end

class Handler
    @next = nil

    def execute(request)
        if request == self.class.name
            puts(self.class.name + " has handle an error")
            return
        end

        if @next == nil
            raise "Handler does not exist in the chain"
        end

        @next.execute(request)
    end

    def setNext(handler)
        @next = handler
        return handler
    end
end
