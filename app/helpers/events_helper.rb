module EventsHelper
  def event_error_messages!
    return  if @event.errors.empty?

    messages = @event.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger alert-dismissable">
    <ul align="left">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
