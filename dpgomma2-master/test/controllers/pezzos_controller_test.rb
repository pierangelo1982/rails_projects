require 'test_helper'

class PezzosControllerTest < ActionController::TestCase
  setup do
    @pezzo = pezzos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pezzos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pezzo" do
    assert_difference('Pezzo.count') do
      post :create, pezzo: { azienda_id: @pezzo.azienda_id, codice: @pezzo.codice, descrizione: @pezzo.descrizione, nome: @pezzo.nome, note: @pezzo.note, prezzo: @pezzo.prezzo }
    end

    assert_redirected_to pezzo_path(assigns(:pezzo))
  end

  test "should show pezzo" do
    get :show, id: @pezzo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pezzo
    assert_response :success
  end

  test "should update pezzo" do
    patch :update, id: @pezzo, pezzo: { azienda_id: @pezzo.azienda_id, codice: @pezzo.codice, descrizione: @pezzo.descrizione, nome: @pezzo.nome, note: @pezzo.note, prezzo: @pezzo.prezzo }
    assert_redirected_to pezzo_path(assigns(:pezzo))
  end

  test "should destroy pezzo" do
    assert_difference('Pezzo.count', -1) do
      delete :destroy, id: @pezzo
    end

    assert_redirected_to pezzos_path
  end
end
