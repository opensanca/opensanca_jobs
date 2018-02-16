# frozen_string_literal: true

Rails.application.config.action_view.sanitized_allowed_tags = %w[b strong span i em p h1 h2 h3 h4 h5 h6 blockquote pre
                                                                 font u table th td tr li ul a img]
Rails.application.config.action_view.sanitized_allowed_attributes = %w[face style href title src data-filename]

Loofah::HTML5::WhiteList::ALLOWED_PROTOCOLS << 'data'
