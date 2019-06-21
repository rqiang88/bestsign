module Bestsign
  class Configuration
    attr_accessor :developer_id, :private_path, :public_path, :env, 
    							:account, :tid

    def production?
      env == 'production'
    end
  end
end