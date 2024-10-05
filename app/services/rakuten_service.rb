# app/services/rakuten_service.rb
class RakutenService
    def self.search_rakuten_api(keyword)
      Rails.logger.info("RakutenService: Searching with keyword: #{keyword}")
  
      # 商品検索APIを使用して商品を検索
      response = RakutenWebService::Ichiba::Item.search(
        keyword: keyword,
        hits: 10,             # 取得する商品の数
        sort: '-reviewCount', # 評価数の降順でソート（オプション）
        # 必要に応じて他のパラメータも追加
      )
  
      Rails.logger.info("RakutenService: Received #{response.count} items")
  
      # レスポンスをビューで期待される形式にマッピング
      items = response.map do |item|
        {
          url: item.item_url || '#', # デフォルトURLを設定
          image: item.medium_image_urls&.first || item.small_image_urls&.first || '',
          name: item.item_name || '名前未設定',
          price: item.item_price || 0
        }
      end
  
      Rails.logger.info("RakutenService: Parsed items: #{items.inspect}")
  
      items
    rescue RakutenWebService::Error => e
      Rails.logger.error("RakutenService Error: #{e.message}")
      []
    end
  end   
  