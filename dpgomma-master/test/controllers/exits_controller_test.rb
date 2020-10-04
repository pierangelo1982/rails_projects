require 'test_helper'

class ExitsControllerTest < ActionController::TestCase
  setup do
    @exit = exits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exit" do
    assert_difference('Exit.count') do
      post :create, exit: { altro: @exit.altro, aspetto: @exit.aspetto, azienda_id: @exit.azienda_id, colli: @exit.colli, consegnato: @exit.consegnato, data: @exit.data, entratum_ids: @exit.entratum_ids, netto: @exit.netto, note: @exit.note, numero: @exit.numero, quantita: @exit.quantita, responsabile_trasporto: @exit.responsabile_trasporto, scarti: @exit.scarti, tax: @exit.tax, tipo_trasporto: @exit.tipo_trasporto, totale: @exit.totale }
    end

    assert_redirected_to exit_path(assigns(:exit))
  end

  test "should show exit" do
    get :show, id: @exit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exit
    assert_response :success
  end

  test "should update exit" do
    patch :update, id: @exit, exit: { altro: @exit.altro, aspetto: @exit.aspetto, azienda_id: @exit.azienda_id, colli: @exit.colli, consegnato: @exit.consegnato, data: @exit.data, entratum_ids: @exit.entratum_ids, netto: @exit.netto, note: @exit.note, numero: @exit.numero, quantita: @exit.quantita, responsabile_trasporto: @exit.responsabile_trasporto, scarti: @exit.scarti, tax: @exit.tax, tipo_trasporto: @exit.tipo_trasporto, totale: @exit.totale }
    assert_redirected_to exit_path(assigns(:exit))
  end

  test "should destroy exit" do
    assert_difference('Exit.count', -1) do
      delete :destroy, id: @exit
    end

    assert_redirected_to exits_path
  end
end
