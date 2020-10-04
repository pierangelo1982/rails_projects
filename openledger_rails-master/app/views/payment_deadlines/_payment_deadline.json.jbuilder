json.extract! payment_deadline, :id, :invoice_id, :price, :data, :paid, :created_at, :updated_at
json.url payment_deadline_url(payment_deadline, format: :json)