class AnimalsController < ApplicationController
    def index
        animals = Animal.all
        render json: animals
    end
    def update
        animal = Animal.find(params[:id])
        animal.update_attributes(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else
            render json: animal.errors
        end
    end
    def show
        animal = Animal.find(params[:id])
            render json: animal.to_json(include: :sightings)
    end

end
