class PaymentDeadline < ActiveRecord::Base
  belongs_to :invoice
end
