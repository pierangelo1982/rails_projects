require 'test_helper'

class EntratadataControllerTest < ActionController::TestCase
  setup do
    @entratadatum = entratadata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entratadata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entratadatum" do
    assert_difference('Entratadatum.count') do
      post :create, entratadatum: { colli: @entratadatum.colli, entrata_id: @entratadatum.entrata_id, lavorazione_id: @entratadatum.lavorazione_id, note: @entratadatum.note, peso: @entratadatum.peso, pezzo_id: @entratadatum.pezzo_id, quantita: @entratadatum.quantita }
    end

    assert_redirected_to entratadatum_path(assigns(:entratadatum))
  end

  test "should show entratadatum" do
    get :show, id: @entratadatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entratadatum
    assert_response :success
  end

  test "should update entratadatum" do
    patch :update, id: @entratadatum, entratadatum: { colli: @entratadatum.colli, entrata_id: @entratadatum.entrata_id, lavorazione_id: @entratadatum.lavorazione_id, note: @entratadatum.note, peso: @entratadatum.peso, pezzo_id: @entratadatum.pezzo_id, quantita: @entratadatum.quantita }
    assert_redirected_to entratadatum_path(assigns(:entratadatum))
  end

  test "should destroy entratadatum" do
    assert_difference('Entratadatum.count', -1) do
      delete :destroy, id: @entratadatum
    end

    assert_redirected_to entratadata_path
  end
end
