require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { brand_id: @product.brand_id, code: @product.code, description: @product.description, discount: @product.discount, discount_two: @product.discount_two, minimum_quantity: @product.minimum_quantity, name: @product.name, position: @product.position, price: @product.price, product_category_id: @product.product_category_id, quantity: @product.quantity, reserved_price: @product.reserved_price, selling_price: @product.selling_price, supplier_id: @product.supplier_id, tax_id: @product.tax_id, warehouse_value: @product.warehouse_value } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { brand_id: @product.brand_id, code: @product.code, description: @product.description, discount: @product.discount, discount_two: @product.discount_two, minimum_quantity: @product.minimum_quantity, name: @product.name, position: @product.position, price: @product.price, product_category_id: @product.product_category_id, quantity: @product.quantity, reserved_price: @product.reserved_price, selling_price: @product.selling_price, supplier_id: @product.supplier_id, tax_id: @product.tax_id, warehouse_value: @product.warehouse_value } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
