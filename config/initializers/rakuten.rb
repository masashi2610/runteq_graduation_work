RakutenWebService.configure do |c|
    c.application_id = ENV['RAKUTEN_APP_ID']  # 環境変数の名前を修正
    c.affiliate_id = ENV['RAKUTEN_AFFILIATE_ID']
  end  
