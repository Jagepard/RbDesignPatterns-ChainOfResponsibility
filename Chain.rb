=begin
author  : Jagepard <jagepard@yandex.ru>
license https://mit-license.org/ MIT
=end

class Chain
    @@chain = {}

    def addToChain(handler)
        if @@chain.has_key?(handler.class.name)
            raise "Handler already exists"
        end
        @@chain[handler.class.name] = handler
    end

    def execute(handlerName)
        if @@chain.empty?
            raise "The chain is empty"
        end

        if @@chain.has_key?(handlerName)
            for key, handler in @@chain
                handler.execute()
                if key == handlerName
                    return;
                end
            end
        end

        raise "Handler does not exist in the chain"
    end
end
