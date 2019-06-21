Bestsign.configuration do |config|
  config.developer_id  = '开发者id'    # null: false
  config.private_path  = '私钥文件'  # null: false
  config.public_path   = '公钥文件'    # null: false
  config.env = 'development'
  # 当企业和合同都唯一时候配置,优先使用用户上传参数
  config.account = '企业账号'
  config.tid = '企业合同模板id'
end