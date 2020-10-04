json.array!(@magazzinos) do |magazzino|
  json.extract! magazzino, :id, :azienda_id, :npezzi, :inlavorazio, :pronti
  json.url magazzino_url(magazzino, format: :json)
end
