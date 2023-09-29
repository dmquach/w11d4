json.merge! @pokemon.attributes

json.moves @pokemon.moves.map{|move| move.name}
