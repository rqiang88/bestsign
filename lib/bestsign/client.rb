module WechatMchPay
  class Client
    include Api
    attr_accessor :configurate

    BASE_URL = 'https://api.mch.weixin.qq.com'

    def initialize(config)
      @configurate = config
    end

    def execute(url, params, method='post')
      url = request_url(url)
      headers = request_headers(url, params, method)
      
      if method == 'post'
        response = RestClient.post(url, params, headers)
      else
        response = RestClient.get(url, headers)
      end
      
      raw_data response
    end

    
    private

    def request_headers url, options={}, method='post'
      options, body = default_url_params.clone, ''

      if method == 'post'
        body = Digest::MD5.hexdigest(options) if options.present?
      else
        options = default_url_params.merge(options)
      end

      str = change_params(options) + url + body
      options[:sign] = URI.escape(hexdigest(str))
      options
    end

    def request_url
      [BASE_URL, url] * ''
    end

  end
end
