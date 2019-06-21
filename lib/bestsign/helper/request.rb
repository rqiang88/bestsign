module Bestsign
  module Helper
    module Request
      
      def default_url_params
        {
          developerId: configurate.developer_id,
          rtick: rtick,
          signType: 'rsa'
        }
      end

      def send_by_template_params
        {
          dpi: "120",
          varNames: 'date,sign',
          isAllowChangeSignaturePosition: "0", 
          isDrawSignatureImage: "1", 
          signatureImageName: "default",
          version: "2"
        }
      end

      def default_request_params
        {
          account: configurate.account,
          tid: configurate.tid
        }
      end

      alias_method :create_contract_pdf_params, :default_request_params
      alias_method :create_by_template_params,  :default_request_params

      private

      def rtick
        number = rand(1000) + 8999
        [Time.now.to_i, number] * ''
      end

    end
  end
end
