module ApplicationHelper

  # Returns the controller name and action as css classes for the HTML body.
  def body_css_classes
    css = 'controller-' + controller_name + ' action-' + action_name
  end

  # Renders flash messages
  def render_flash_messages
    s = ''
    flash.each do |k,v|
      s << content_tag('div', v.html_safe, :class => "flash #{k}", :id => "flash_#{k}")
    end
    s.html_safe
  end

end
