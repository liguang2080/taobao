# Taobao

淘宝 SDK

## Installation

Add this line to your application's Gemfile:

	gem 'taobao', :git => "git://github.com/lg2046/taobao.git"

And then execute:

    $ bundle or bundle update

Or install it yourself as:

    $ gem install taobao

## Usage

	Rails设置
	
	在Rails.root/config/taobao.yml进行配置
	
	development:
	  key: '1012673352'
	  secret: 'sandbox0dc60e65912c69db3c1cff70f'
	
	OAuth 2 认证
	
	Taobao::TopAuth.container_url
	
	OAuth 回调:
	
	parse_hash = Taobao::TopAuth.parseTopResponse(params[:top_parameters], params[:top_session], params[:top_sign])
	
	解析出如下hash值: { :visitor_id :visitor_nick :session_key :session_expire_in :refresh_token :refresh_token_expire_in }
	
	如无法解析返回nil

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
