class Api::PokemonController < ApplicationController

    def index
        @pokemons = Pokemon.all
        render :index
    end

    def show
        begin
            @pokemon = Pokemon.find(params[:id])
        rescue => exception
            render json: {:error => exception.message}, status: :not_found
        else
            render :show
        end
    end

    def create
    end

    def update
    end

    def type
        render json: Pokemon::TYPES
    end
end
