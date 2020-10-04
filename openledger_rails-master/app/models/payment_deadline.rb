class PaymentDeadline < ApplicationRecord
  belongs_to :invoice, inverse_of: :payment_deadlines
end
