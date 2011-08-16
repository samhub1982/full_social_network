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
  
  def warn_if_char_count_exceeded(field_id, update_id, maximum_number_of_chars, options = {})

function = "var out = [];
var remaining_chars = $(#{maximum_number_of_chars}) - $F('#{field_id}').length;
if (remaining_chars >= 0) {
out = remaining_chars;
document.getElementById('#{field_id}').style.backgroundColor='white'
} else {
out = 'Too long by ' + remaining_chars;
document.getElementById('#{field_id}').style.backgroundColor='red'
}
$('#{update_id}').innerHTML = out;"

out = javascript_tag(function)
out += observe_field(field_id, options.merge(:function => function))
end
end
