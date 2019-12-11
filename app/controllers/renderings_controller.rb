class RenderingsController < ApplicationController
  require 'rest-client'
  skip_before_action :authorized

  NASA_API_KEY = ENV['nasa_api_key']

  def marsrover

    url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=#{NASA_API_KEY}"
    response = RestClient.get("#{url}")
    parsedJSON = JSON.parse(response)

    render json: parsedJSON["photos"] 

  end

  def nasalibrary

    searchTerm = "moon"
    url = "https://images-api.nasa.gov//search?q=#{searchTerm}"
    response = RestClient.get("#{url}")
    parsedJSON = JSON.parse(response)

    render json: parsedJSON["collection"]["items"] 
    
  end

end