require File.dirname(__FILE__) + '/taobao/version'

require File.dirname(__FILE__) + '/taobao/config'
require File.dirname(__FILE__) + '/taobao/oauth'
require File.dirname(__FILE__) + '/taobao/client'


if Rails
  require File.dirname(__FILE__) + '/taobao/railtie'
end
