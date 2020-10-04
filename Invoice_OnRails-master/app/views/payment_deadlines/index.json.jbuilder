json.array!(@payment_deadlines) do |payment_deadline|
  json.extract! payment_deadline, :id, :invoice_id, :data, :testo, :note
  json.url payment_deadline_url(payment_deadline, format: :json)
end
