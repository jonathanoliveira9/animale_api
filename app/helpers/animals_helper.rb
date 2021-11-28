module AnimalsHelper
  def color_status(status)
    case status
    when 'lost'
      content_tag(:span, I18n.t('.helpers.lost').titleize, class: 'badge rounded-pill bg-danger')
    when 'communicated'
      content_tag(:span, I18n.t('.helpers.communicated').titleize, class: 'badge rounded-pill bg-primary')
    when 'found'
      content_tag(:span, I18n.t('.helpers.found').titleize, class: 'badge rounded-pill bg-success')
    end
  end
end
