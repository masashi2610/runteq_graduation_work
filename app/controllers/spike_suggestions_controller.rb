class SpikeSuggestionsController < ApplicationController
  before_action :require_login, except: :index
  before_action :set_user, except: :index

  # GET /spike_suggestions
  def index
    if request.get?
      # 初期表示用のキーワードで楽天API検索
      keyword = params[:keyword] || t('野球スパイク最新')
      
      # オススメスパイクを楽天APIから取得
      @items = RakutenService.search_rakuten_api('野球スパイク')

      # 初期表示時に取得したアイテムをオススメとしてセット
      @recommended_items = RakutenService.search_rakuten_api('野球スパイク') 
    elsif request.post?
      # フォームからの提案生成リクエスト
      if all_params_present?(params[:spike_suggestion])
        @suggestion = OpenaiService.get_chat_response(spike_suggestion_params(params[:spike_suggestion]))
        Rails.logger.info("OpenAI Suggestion: #{@suggestion}")
        @keyword = self.class.extract_product_name(@suggestion)
        Rails.logger.info("Extracted Keyword: #{@keyword}")

        if @keyword.present?
          begin
            @items = RakutenService.search_rakuten_api(@keyword)
          rescue RakutenWebService::WrongParameter => e
            Rails.logger.error("Rakuten API Error: #{e.message}")
            @items = []
            @error_message = t('spike_suggestions.index.not_found_products')
          end
        else
          @items = []
          @error_message = t('spike_suggestions.index.not_found_products')
        end

        if @user.can_suggest?
          @user.increment_suggestion_count
        else
          @error_message ||= t('spike_suggestions.index.suggestion_limit.failure')
        end
      else
        flash.now[:alert] = t('spike_suggestions.create.failure')
        @items = []
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  # フォームから送信されたパラメータを許可
  def spike_suggestion_params(params)
    params.permit(:spike_type, :budget, :weight, :anckle_type, :memo)
  end

  # 必要なパラメータが全て揃っているか確認
  def all_params_present?(params)
    required_params = [:spike_type, :budget, :weight, :anckle_type, :memo]
    required_params.all? { |param| params[param].present? }
  end

  # 提案内容から商品名を抽出するクラスメソッド
  public_class_method def self.extract_product_name(text)
    return unless text =~ /(?:「)([^」]+)(?:」)/
    
    Regexp.last_match(1).strip
  end
end
  