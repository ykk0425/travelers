json.data do
  json.items do
    json.array!(@plan.spots) do |spot|
      json.id spot.id
      json.name spot.name
      json.latitude spot.latitude
      json.longitude spot.longitude
    end  
  end
end