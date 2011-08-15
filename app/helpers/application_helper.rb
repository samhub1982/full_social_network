module ApplicationHelper
  
  def title
    base_title = "Social Network"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Logo goes here", :class => "round")
  end
end
