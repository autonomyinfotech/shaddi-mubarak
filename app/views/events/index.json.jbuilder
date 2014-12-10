json.array!(@events) do |event|
  json.extract! event, :id
  json.title event.event_type.name
  json.description event.customer.full_name if event.customer
  json.start event.start_date.to_date
  json.end event.end_date.to_date.next
end