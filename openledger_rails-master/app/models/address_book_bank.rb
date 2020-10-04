class AddressBookBank < ApplicationRecord
  belongs_to :address_book, inverse_of: :address_book_banks
end
