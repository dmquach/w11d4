
# json.array! @pokemons, :id, :number, :name, (:captured == true ? :image_url : :default_url), :captured


json.array! @pokemons do |pokemon|
    json.id pokemon.id
    json.number pokemon.number
    json.name pokemon.name
    json.captured pokemon.captured
    if pokemon.captured
        json.image_url pokemon.image_url
    else
        json.image_url "/images/unknown.png"
    end
end