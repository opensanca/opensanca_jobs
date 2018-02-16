# frozen_string_literal: true

module ShareLinksHelper
  PROVIDERS = {
    facebook: { url: 'https://www.facebook.com/sharer/sharer.php?u=#current_page#', icon: 'fa-facebook-official' },
    twitter:  { url: 'https://twitter.com/home?status=Look this job: #current_page#', icon: 'fa-twitter-square' },
    linkedin: { url: 'https://www.linkedin.com/shareArticle?url=#current_page#', icon: 'fa-linkedin-square' }
  }.freeze

  def share_links_to_current_page
    current_page = request.original_url
    content_tag(:p) do
      PROVIDERS.keys.map { |social_network| concat(share_link_for(social_network, current_page)) }
    end
  end

  private

  def share_link_for(social_network, page)
    provider   = PROVIDERS[social_network]
    share_url  = provider[:url].gsub('#current_page#', page)
    link_to(share_url, target: 'blank') do
      content_tag(:i, nil, class: "fa #{provider[:icon]} fa-2x", 'aria-hidden' => true)
    end + ' '
  end
end
