require 'rails_helper'

RSpec.describe OpenWeatherMapService, type: :service do
  weather_schema = SpecSchemas::OpenWeatherMap::Weather.new.schema
  forecast_schema = SpecSchemas::OpenWeatherMap::Forecast.new.schema

  describe '#OpenWeatherMapService' do
    it 'get weather by city' do
      response = OpenWeatherMapService.get_weather(q: 'florianopolis')

      expect(response.class).to eq(Hash)
      expect(response['name']).to eq('Florianópolis')
    end

    it 'get weather by latitude an longitude' do
      response = OpenWeatherMapService.get_weather(lat: '51.5085', lon: '-0.1257')

      expect(response.class).to eq(Hash)
      expect(response['name']).to eq('London')
    end

    it 'get forecast by city' do
      response = OpenWeatherMapService.get_forecast(q: 'florianopolis')

      expect(response.class).to eq(Hash)
      expect(response['city']['name']).to eq('Florianópolis')
    end

    it 'get forecast by latitude an longitude' do
      response = OpenWeatherMapService.get_forecast(lat: '51.5085', lon: '-0.1257')

      expect(response.class).to eq(Hash)
      expect(response['city']['name']).to eq('London')
    end
  end
end
