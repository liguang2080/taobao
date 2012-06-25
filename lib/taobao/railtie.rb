module Taobao
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      Taobao::Config.load_config
    end
  end
end
