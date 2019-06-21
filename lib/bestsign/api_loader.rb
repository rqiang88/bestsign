module Bestsign
  module ApiLoader
    class << self
      def with(config)
        raise "developer_id not allow blank"  if config.developer_id.blank?
        raise "private_path not allow blank" if config.private_path.blank?
        raise "public_path not allow blank" if config.public_path.blank?
        Client.new(config)
      end
    end
  end
end