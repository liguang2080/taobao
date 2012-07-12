require File.expand_path(File.dirname(__FILE__) + '/taobao/version')

require File.expand_path(File.dirname(__FILE__) + '/taobao/config')
require File.expand_path(File.dirname(__FILE__) + '/taobao/top_auth')
require File.expand_path(File.dirname(__FILE__) + '/taobao/client')


if defined? Rails
  require File.expand_path(File.dirname(__FILE__) + '/taobao/railtie')
end
