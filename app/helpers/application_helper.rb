module ApplicationHelper
    def page_title(title = '')
      base_title = 'Spike Log'
      title.present? ? "#{title} | #{base_title}" : base_title
    end

    def default_meta_tags
        {
          site: 'Spike Log',
          title: 'スパイクログ',
          reverse: true,
          charset: 'utf-8',
          description: '野球スパイクの管理・検索ができるサービス',
          keywords: '野球,スパイク,おすすめ',
          canonical: request.original_url,
          icon: [
            { href: image_url('favicon.jpeg') }
          ]
        }
      end
  end
