class InvoiceExit < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :exit
end
