# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-block',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def error_tag(model, attribute)
    return unless model.errors.key?(attribute)

    content_tag(
      :div,
      model.errors[attribute].join(', '),
      class: 'error_message'
    )
  end

  def menu_class(path)
    current_page?(path) ? 'active' : ''
  end

  def no_content_message(message)
    content_tag(:div, content_tag(:h3, message, class: 'no-content'))
  end
end
