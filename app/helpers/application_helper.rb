module ApplicationHelper

  def svg_tag(icon_name)
    file = Rails.root.join("app", "assets", "images", icon_name.to_s).read
    doc = Nokogiri::HTML::DocumentFragment.parse(file)
    doc.to_html.html_safe
  end
end
