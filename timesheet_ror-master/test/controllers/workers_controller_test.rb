require 'test_helper'

class WorkersControllerTest < ActionController::TestCase
  setup do
    @worker = workers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post :create, worker: { active: @worker.active, cap: @worker.cap, cellulare: @worker.cellulare, citta: @worker.citta, codfisc: @worker.codfisc, cognome: @worker.cognome, costo_ora: @worker.costo_ora, email: @worker.email, indirizzo: @worker.indirizzo, nome: @worker.nome, password: @worker.password, piva: @worker.piva, provincia: @worker.provincia, role_id: @worker.role_id, telefono: @worker.telefono }
    end

    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should show worker" do
    get :show, id: @worker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worker
    assert_response :success
  end

  test "should update worker" do
    patch :update, id: @worker, worker: { active: @worker.active, cap: @worker.cap, cellulare: @worker.cellulare, citta: @worker.citta, codfisc: @worker.codfisc, cognome: @worker.cognome, costo_ora: @worker.costo_ora, email: @worker.email, indirizzo: @worker.indirizzo, nome: @worker.nome, password: @worker.password, piva: @worker.piva, provincia: @worker.provincia, role_id: @worker.role_id, telefono: @worker.telefono }
    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
      delete :destroy, id: @worker
    end

    assert_redirected_to workers_path
  end
end
