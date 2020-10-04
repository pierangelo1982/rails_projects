class InvoiceEntratum < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :entratum
end
