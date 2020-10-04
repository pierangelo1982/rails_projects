json.array!(@workers) do |worker|
  json.extract! worker, :id, :role_id, :nome, :cognome, :codfisc, :piva, :indirizzo, :cap, :citta, :provincia, :telefono, :cellulare, :costo_ora, :email, :password, :active
  json.url worker_url(worker, format: :json)
end
