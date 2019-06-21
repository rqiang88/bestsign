module Bestsign
  module Helper
    module Signature
      def hexdigest(data)
        private_key = File.read(configurate.private_path)
        rsa = OpenSSL::PKey::RSA.new private_key
        sign = rsa.sign('SHA1', data)
        Base64.encode64(sign)
      end

      def verify?(data, signature)
        public_key = File.read(configurate.public_path)
        rsa = OpenSSL::PKey::RSA.new public_key
        rsa.verify('SHA1', signature, data)
      end

    end
  end
end