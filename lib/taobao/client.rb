module Taobao
  class Client

    def initialize(session_key)
      @api_url = Rails.env.production? ? "http://gw.api.taobao.com/router/rest" : "http://gw.api.tbsandbox.com/router/rest"
      @api_key = Taobao::Config.app_key
      @api_secret = Taobao::Config.app_secret
      @session_key = session_key

    end

    def system_params
      {
        # :method => nil,
        :session_key => @session_key,
        # :timestamp => nil,
        :format => "json",
        :app_key => @api_key,
        :v => "2.0",
        # :sign => nil,
        :sign_method => "md5"
      }
    end

    def post(method, method_options)
      rest_params = system_params.merge(method_options)
      rest_params.merge!({:method => method, :timestamp => Time.zone.now.to_s(:middle_line_all)})

      sign = Digest::MD5.hexdigest(@api_secret + rest_params.to_a.sort_by {|pair| pair.first}.flatten.join("") + @api_secret)
      RestClient.post @api_url, rest_params.merge(:sign => sign.upcase)
    end
  end
end
