class RakutenService
  def self.search_rakuten_api(keyword)
    return [] if keyword.blank? # キーワードが空の場合は空の配列を返す

    app_id = Rails.application.credentials.rakuten[:app_id] # アプリケーションIDを取得
    affiliate_id = Rails.application.credentials.rakuten[:affiliate_id] # アフィリエイトIDも取得

    raise 'Application ID is not defined' if app_id.blank? # アプリケーションIDが空ならエラーを発生させる

    items = RakutenWebService::Ichiba::Item.search(
      keyword: keyword,
      application_id: app_id, # アプリケーションIDを指定
      affiliate_id: affiliate_id # アフィリエイトIDを指定
    ).first(8)

    items.map do |item|
      {
        name: item['itemName'],
        price: item['itemPrice'],
        url: item['itemUrl'],
        image: item['mediumImageUrls'].first
      }
    end
  end
end
