class TagDecorator < Draper::Decorator
  delegate_all

  def category_color
    if Tag.major_categories.exists?(id)
      'bg-amber-100'
    elsif Tag.special_tags.exists?(id)
      'bg-blue-100'
    else
      'bg-green-100'
    end
  end
end
