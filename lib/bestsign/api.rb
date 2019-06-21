require 'bestsign/helper/service'
require 'bestsign/helper/signature'
require 'bestsign/helper/request'

module Bestsign
  module Api
    include Helper::Service
    include Helper::Signature
    include Helper::Request

    def perform action, options={}
      default_params = respond_to?("#{action}_params") ? send("#{action}_params") : {}
      options = merge_params(default_params, options)
      send("#{action}", options)
    end

    # 注册用户
    def reg options
      p 'tianxiaweigong'
      url = '/openapi/v2/user/reg/'
      execute(url, options)
    end

    def reg_query options
      url = '/openapi/v2/user/async/applyCert/status/'
      execute(url, options)
    end

    # 通过模版生成合同文件
    def create_contract_pdf options
      url = '/openapi/v2/template/createContractPdf/'
      execute(url, options)
    end

    # 通过模版创建合同
    def create_by_template options
      url = '/openapi/v2/contract/createByTemplate/'
      execute(url, options)
    end

    def user_upload options
      url = '/openapi/v2/signatureImage/user/upload/'
      execute(url, options)
    end

    # 手动签署合同
    def send_by_template options
      url = '/openapi/v2/contract/sendByTemplate/'
      execute(url, options)
    end

    # 自动签署合同
    def sign_template options
      url = '/openapi/v2/contract/sign/template/'
      execute(url, options)
    end

    # 锁定并结束合同
    def lock options
      url = '/openapi/v2/storage/contract/lock/'
      execute(url, options)
    end

    def create_attachment options
      url = '/openapi/v2/contract/createAttachment'
      execute(url, options)
    end

    def download_attachment options
      url = '/openapi/v2/contract/downloadAttachment'
      get(url, options)
    end

    # 下载合同文件。
    def download options
      url = '/openapi/v2/contract/download'
      get(url, options)
    end

    # 预览合同
    def get_preview_url options
      url = '/openapi/v2/contract/getPreviewURL'
      execute(url, options)
    end
  end
end