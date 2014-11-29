module ConfigurationHelper
  def hall_error_messages!
    return  if @hall.errors.empty?

    messages = @hall.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger alert-dismissable">
    <ul align="left">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def hall_language
    lang = @hall.language
    if lang == 'mr'
      t('marathi')
    elsif lang == 'hi'
      t('hindi')
    else
      t('english')
    end
  end
end
