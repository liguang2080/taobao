module Taobao
  class TopAuth
    extend Rack::Utils

    def self.container_url
      if Rails.env.development?
        "http://container.api.tbsandbox.com/container?appkey=#{Taobao::Config.key}&encode=utf-8"
      else
        "http://container.api.taobao.com/container?appkey=#{Taobao::Config.key}&encode=utf-8"
      end
    end

    def self.parseTopResponse(key, param, session, secret, sign)
      # 验证签名是否合法
      return nil unless verifySign(key, param, session, secret, sign)

      # 验证时间戳是否在应用允许的误差范围 五分钟内
      params_hash = parse_nested_query(Base64.decode64(param))
      return nil unless verifyTimeStamp(params_hash)

      # 如果用户登陆,传的是visitor_id和visitor_nick;如果用户没有登陆则没有
      return nil unless params_hash["visitor_id"] && params_hash["visitor_nick"]

      {
        :visitor_id => params_hash["visitor_id"],
        :visitor_nick => params_hash["visitor_nick"],
        :session_key => session,
        :session_expire_in => Time.zone.now + params_hash["expires_in"].to_i,
        :refresh_token => params_hash["refresh_token"],
        :refresh_token_expire_in => Time.zone.now + params_hash["re_expires_in"].to_i
      }
    end

    private
    def self.verifySign(key, param, session, secret, sign)
      md5_sign = Base64.encode64(Digest::MD5.digest(key + param + session + secret))
      md5_sign.strip == sign
    end

    def self.verifyTimeStamp(params_hash)
      ts = Time.zone.at(params_hash["ts"].to_i / 1000)
      ((Time.zone.now + 5.minutes) > ts) && ((Time.zone.now - 5.minutes) < ts)
    end

  end
end
