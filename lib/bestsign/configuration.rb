module Bestsign
  class Configuration
    attr_accessor :developer_id, :private_path, :public_path, :env

    def production?
      env == 'production'
    end
  end
end