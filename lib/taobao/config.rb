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
        @app_key, @app_secret, @redirect_uri = config['app_key'], config['app_secret'], config['redirect_uri']
        unless @app_key && @app_secret && @redirect_uri
          puts "Please configure your Tencentpay settings in #{filename}."
        end
      end
    end
  end
end