# -*- encoding : utf-8 -*-
require 'rdoc'

##
# Namespace for the ri command line tool's implementation.
#
# See <tt>ri --help</tt> for details.

module RDoc::RI

  ##
  # Base RI error class

  class Error < RDoc::Error; end

  autoload :Driver, 'rdoc/ri/driver'
  autoload :Paths,  'rdoc/ri/paths'
  autoload :Store,  'rdoc/ri/store'

end

