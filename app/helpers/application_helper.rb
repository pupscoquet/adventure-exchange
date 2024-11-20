module ApplicationHelper
  def body_bg_colour
    if @bg_red
      'bg-red'
    elsif @bg_blue
      'bg-blue'
    end
  end
end
