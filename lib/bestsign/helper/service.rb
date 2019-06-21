module Bestsign
  module Helper
    module Service
      def handle_params(options={})
        ActiveSupport::HashWithIndifferentAccess.new(options)
      end

      def raw_post
      end

      def merge_params default_params, options
        default_params = handle_params default_params
        options = handle_params options

        default_params.keys.each{|k| options[k] = default_params[k] if options[k].blank? }
        options
      end

      def base_url
        if configurate.production?
          'https://openapi.bestsign.cn'
        else
          'https://openapi.bestsign.info'
        end
      end

      def change_params(params, type='')
        data = params.sort.map do |k, v|
          "#{k}=#{v}" if v.present?
        end
        data.compact * type
      end

      def raw_data response 
        return {status: 'fail', msg: '请求错误,请稍后重试'} unless response.code.to_i == 200
        data = JSON.parse response.body
        if data['errno'].to_i == 0
          {status: 'success', data: data['data']}
        else
          {status: 'fail', msg: data['errmsg'], data: data}
        end
      end
    end
  end
end
