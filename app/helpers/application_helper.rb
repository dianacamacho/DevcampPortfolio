module ApplicationHelper
  def login_helper(style='')
    if current_user.is_a?(GuestUser)
      (link_to "Sign In", new_user_session_path, class: style) +
      " ".html_safe +
      (link_to "Sign Up", new_user_registration_path, class: style)
    else
      link_to "Sign Out", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]} and you are on #{layout_name} layout", class: "source-greeting")
    end
  end

  def copyright_generator
    DcamViewTool::Renderer.copyright('Diana Camacho', 'All Rights Reserved')
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Home'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active?(path)
    "active" if current_page?(path)
  end
end
