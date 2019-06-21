module Bestsign
  class Client
    include Api
    attr_accessor :configurate

    BASE_URL = 'https://openapi.bestsign.info'

    def initialize(config)
      @configurate = config
    end

    def execute(url, params, method='post')
      params = handle_params params
      headers = request_headers(url, params, method)
      url = request_url(url)

      if method == 'post'
        response = RestClient.post(url, params.to_json, content_type: :json, params: headers)
      else
       response = RestClient::Request.execute(method: :get, url: url, headers: {params: headers})
      end
      
      raw_data response
    end

    def get(url, params)
      params = handle_params params
      headers = request_headers(url, params, 'get')
      url = request_url(url)

      headers['sign'] = CGI.escape(headers['sign'])
      url = url + '?' + change_params(headers, '&')
      p "====", url
      url
    end
    
    private

    def request_headers url, data={}, method='post'
      options, body = default_url_params.clone, ''
      options = handle_params options

      if method == 'post'
        body = Digest::MD5.hexdigest(data.to_json) if data.present?
      else
        options = options.merge(data)
      end

      str = change_params(options) + url + body
      options['sign'] = hexdigest(str)
      options
    end

    def request_url url
      [BASE_URL, url] * ''
    end

  end
end
