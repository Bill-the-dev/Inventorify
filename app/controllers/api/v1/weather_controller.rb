class Api::V1::WeatherController < ApplicationController
  require "rest-client"
  require "json"
  before_action :set_location, only: %i[ show ]

  # /api/v1/locations/:location_id/weather
  def show
    debugger
    api_key = Rails.application.credentials.open_weather_api
    zip, country = @location.zip, @location.country
    
    zip_weather_url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zip},#{country}&units=imperial&appid=#{api_key}"

    res_weather = RestClient.get(zip_weather_url)
    @data = JSON.parse(res_weather.body, object_class: OpenStruct)

    weather_str = "#{@data.main.temp.round(0)} F, #{@data.weather[0].description}"
    # weather_icon = "http://openweathermap.org/img/wn/#{@data.weather[0].icon}@2x.png"
    # debugger
    # render json: @data
    render json: weather_str
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:location_id])
    end

    # Only allow a list of trusted parameters through.
    # def location_params
    #   params.require(:location).permit(:city, :state, :country, :zip, :weather, :item_id)
    # end
end


    # Convert City, State, Country into coordinates
    # city, state, country = params[:city], params[:state], params[:country]
    # get_coord_url = "http://api.openweathermap.org/geo/1.0/direct?q=#{city},#{state},#{country}&limit=#{limit}&appid=#{api_key}"
    
    # res_coord = RestClient.get(get_coord_url)
    # coords = JSON.parse(res_coord.body)
    # lat, lon = coords["lat"], coords["lon"]

    # coord_weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units=imperial&appid=#{api_key}"