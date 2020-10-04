class PurchasePaymentDeadline < ApplicationRecord
  belongs_to :purchase_invoice, inverse_of: :purchase_payment_deadlines
end
