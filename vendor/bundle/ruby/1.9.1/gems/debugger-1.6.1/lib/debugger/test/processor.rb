# -*- encoding : utf-8 -*-
class Debugger::Processor
  class << self
    def print(message)
      Debugger.handler.interface.print_queue << message
    end
  end
end
