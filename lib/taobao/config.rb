# -*- encoding : utf-8 -*-
require "digest/md5"
require "base64"

module Taobao
  module Config
    class << self
      attr_reader :key, :secret

      def load_config
        filename = "#{Rails.root}/config/taobao.yml"
        config = YAML.load(File.open(filename))[Rails.env]
        @key, @secret = config['key'], config['secret']
        raise "Please configure your Tencentpay settings in #{filename}." unless @key && @secret
      end
    end
  end
end