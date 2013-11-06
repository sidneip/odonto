# -*- encoding : utf-8 -*-
class LoadError
  REGEXPS = [
    /^no such file to load -- (.+)$/i,
    /^Missing \w+ (?:file\s*)?([^\s]+.rb)$/i,
    /^Missing API definition file in (.+)$/i,
    /^cannot load such file -- (.+)$/i,
  ]

  unless method_defined?(:path)
    def path
      @path ||= begin
        REGEXPS.find do |regex|
          message =~ regex
        end
        $1
      end
    end
  end

  def is_missing?(location)
    location.sub(/\.rb$/, '') == path.sub(/\.rb$/, '')
  end
end

MissingSourceFile = LoadError
