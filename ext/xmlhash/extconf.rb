require 'mkmf'
require 'pkg-config'
abort 'xml2 is missing.  please install libxml2' unless find_library('xml2', 'xmlAddID')
$CFLAGS << ' ' + PackageConfig.new('libxml-2.0').cflags
create_makefile('xmlhash/xmlhash')
