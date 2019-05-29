module Bestsign
  module Helper
    module Signature
      def hexdigest(data)
        private_key = File.read(configture.private_key)
        rsa = OpenSSL::Pkey::RSA.new private_key
        sign = rsa.hexdigest('sha1', data)
        Base64.encode64 sign
      end

      def verify?(data, signature)
        hexdigest(data) == signature
      end

    end
  end
end