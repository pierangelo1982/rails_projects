require 'test_helper'

class AddressBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address_book = address_books(:one)
  end

  test "should get index" do
    get address_books_url
    assert_response :success
  end

  test "should get new" do
    get new_address_book_url
    assert_response :success
  end

  test "should create address_book" do
    assert_difference('AddressBook.count') do
      post address_books_url, params: { address_book: { address: @address_book.address, address_nr: @address_book.address_nr, city: @address_book.city, country: @address_book.country, customer: @address_book.customer, email: @address_book.email, fax: @address_book.fax, name: @address_book.name, note: @address_book.note, phone: @address_book.phone, supplier: @address_book.supplier, tax_code: @address_book.tax_code, vat: @address_book.vat, web: @address_book.web, zip: @address_book.zip } }
    end

    assert_redirected_to address_book_url(AddressBook.last)
  end

  test "should show address_book" do
    get address_book_url(@address_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_book_url(@address_book)
    assert_response :success
  end

  test "should update address_book" do
    patch address_book_url(@address_book), params: { address_book: { address: @address_book.address, address_nr: @address_book.address_nr, city: @address_book.city, country: @address_book.country, customer: @address_book.customer, email: @address_book.email, fax: @address_book.fax, name: @address_book.name, note: @address_book.note, phone: @address_book.phone, supplier: @address_book.supplier, tax_code: @address_book.tax_code, vat: @address_book.vat, web: @address_book.web, zip: @address_book.zip } }
    assert_redirected_to address_book_url(@address_book)
  end

  test "should destroy address_book" do
    assert_difference('AddressBook.count', -1) do
      delete address_book_url(@address_book)
    end

    assert_redirected_to address_books_url
  end
end
