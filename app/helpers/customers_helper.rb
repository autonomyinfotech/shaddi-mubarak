module CustomersHelper
  def customer_error_messages!
    return  if @customer.errors.empty?

    messages = @customer.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger alert-dismissable">
    <ul align="left">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
