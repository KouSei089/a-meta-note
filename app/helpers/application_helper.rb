module ApplicationHelper
  def default_meta_tags
    {
      site: 'a meta note',
      title: 'a meta note',
      reverse: false,
      charset: 'utf-8',
      description: 'Analyze your daily schedule get the optimal lifestyle.',
      keywords: 'schedule, note, analysis',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('twitter_header_photo_2.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('logo.png'),
        locale: 'ja_JP'
      }
      # twitter: {
      #   card: 'summary',
      #   site: '@ツイッターのアカウント名',
      # }
    }
  end
end
