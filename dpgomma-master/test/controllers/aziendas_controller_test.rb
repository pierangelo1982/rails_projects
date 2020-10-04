require 'test_helper'

class AziendasControllerTest < ActionController::TestCase
  setup do
    @azienda = aziendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aziendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create azienda" do
    assert_difference('Azienda.count') do
      post :create, azienda: { active: @azienda.active, cap: @azienda.cap, cell: @azienda.cell, citta: @azienda.citta, codfisc: @azienda.codfisc, denominazione: @azienda.denominazione, email: @azienda.email, fax: @azienda.fax, indirizzo: @azienda.indirizzo, logo: @azienda.logo, note: @azienda.note, pec: @azienda.pec, piva: @azienda.piva, referente: @azienda.referente, tel: @azienda.tel, web: @azienda.web }
    end

    assert_redirected_to azienda_path(assigns(:azienda))
  end

  test "should show azienda" do
    get :show, id: @azienda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @azienda
    assert_response :success
  end

  test "should update azienda" do
    patch :update, id: @azienda, azienda: { active: @azienda.active, cap: @azienda.cap, cell: @azienda.cell, citta: @azienda.citta, codfisc: @azienda.codfisc, denominazione: @azienda.denominazione, email: @azienda.email, fax: @azienda.fax, indirizzo: @azienda.indirizzo, logo: @azienda.logo, note: @azienda.note, pec: @azienda.pec, piva: @azienda.piva, referente: @azienda.referente, tel: @azienda.tel, web: @azienda.web }
    assert_redirected_to azienda_path(assigns(:azienda))
  end

  test "should destroy azienda" do
    assert_difference('Azienda.count', -1) do
      delete :destroy, id: @azienda
    end

    assert_redirected_to aziendas_path
  end
end
