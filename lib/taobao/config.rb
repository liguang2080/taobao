# -*- encoding : utf-8 -*-
require "digest/md5"
require "base64"

module Taobao
  module Config
    class << self
      attr_reader :app_key, :app_secret, :redirect_uri

      def load_config
        filename = "#{Rails.root}/config/taobao.yml"
        config = YAML.load(File.open(filename))[Rails.env]
        @app_key, @app_secret, @redirect_uri = config['app_key'], config['secret'], config['redirect_uri']
        raise "Please configure your Tencentpay settings in #{filename}." unless @app_key && @app_secret && @redirect_uri
      end
    end
  end
end