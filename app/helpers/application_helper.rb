module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error:   "alert-error",
      alert:   "alert-block",
      notice:  "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def menu_class(path)
    current_page?(path) ? "active" : ""
  end

  def error_tag(model, attribute)
    if model.errors.has_key? attribute
      content_tag(
        :div,
        model.errors[attribute].join(", "),
        class: "error_message"
      )
    end
  end
end
