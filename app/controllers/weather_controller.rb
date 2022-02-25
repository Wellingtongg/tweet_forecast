require 'open_weather_map_api'

class WeatherController < ApplicationController
  def tweet
    begin
      forecast = OpenWeatherMapApi.get_forecast(tweet_params)

      if forecast.present?
        response = TwitterService.new.tweet_forecast(forecast)
        render json: response, status: :ok
      else
        render json: {}, status: :not_found
      end
    rescue => err
      render json: {}, status: :internal_server_error
    end
  end

  private

  def tweet_params
    params.permit(
      :q,
      :lat,
      :lon,
      :units,
      :lang,
      :appid,
      :cnt,
      :mode
    )
  end
end