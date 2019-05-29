module Bestsign
  module Helper
    module Request
      def default_url_params
        {
          developer_id: config.developer_id,
          rtick: rtick,
          signType: 'rsa'
        }
      end


      private

      def rtick
        number = rand(1000) + 8999
        [Time.now.to_i, number] * ''
      end

      def change_params params
        data = params.sort.map do |k, v|
          "#{k}=#{v}" if v.present?
        end
        data.compact * ''
      end
    end
  end
end
