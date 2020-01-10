class SightingsController < ApplicationController
    def index
      sightings = Sighting.all
      render json: sightings
    end
    def show
        sighting = Sighting.find(params[:id])
            render json: sighting
    end
    def update
        sightings = Sighting.find(params[:id])
        sightings.update_attributes(sightings_params)
        if sightings.valid?
            render json: sightings
        else
            render json: sightings.errors
        end
    end
    def destroy
        sightings = Sighting.find(params[:id])
        if sightings.destroy
            render json: sightings
        else
            render json: sightings.errors
        end
    end
    def sightings_params
        params.require(:sighting).permit(:date, :latitude, :longitude)
    end
end
