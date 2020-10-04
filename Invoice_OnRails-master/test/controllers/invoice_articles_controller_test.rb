require 'test_helper'

class InvoiceArticlesControllerTest < ActionController::TestCase
  setup do
    @invoice_article = invoice_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_article" do
    assert_difference('InvoiceArticle.count') do
      post :create, invoice_article: { codice: @invoice_article.codice, descrizione: @invoice_article.descrizione, importo: @invoice_article.importo, prezzo_unitario: @invoice_article.prezzo_unitario, quantita: @invoice_article.quantita, tax_id: @invoice_article.tax_id, titolo: @invoice_article.titolo }
    end

    assert_redirected_to invoice_article_path(assigns(:invoice_article))
  end

  test "should show invoice_article" do
    get :show, id: @invoice_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice_article
    assert_response :success
  end

  test "should update invoice_article" do
    patch :update, id: @invoice_article, invoice_article: { codice: @invoice_article.codice, descrizione: @invoice_article.descrizione, importo: @invoice_article.importo, prezzo_unitario: @invoice_article.prezzo_unitario, quantita: @invoice_article.quantita, tax_id: @invoice_article.tax_id, titolo: @invoice_article.titolo }
    assert_redirected_to invoice_article_path(assigns(:invoice_article))
  end

  test "should destroy invoice_article" do
    assert_difference('InvoiceArticle.count', -1) do
      delete :destroy, id: @invoice_article
    end

    assert_redirected_to invoice_articles_path
  end
end
