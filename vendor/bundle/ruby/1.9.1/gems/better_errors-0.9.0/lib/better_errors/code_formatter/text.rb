# -*- encoding : utf-8 -*-
module BetterErrors
  # @private
  class CodeFormatter::Text < CodeFormatter
    def source_unavailable
      "# Source is not available"
    end

    def formatted_lines
      each_line_of context_lines do |highlight, current_line, str|
        sprintf '%s %3d   %s', (highlight ? '>' : ' '), current_line, str
      end
    end
  end
end
