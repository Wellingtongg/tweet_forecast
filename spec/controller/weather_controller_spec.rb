require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe "POST tweet" do
    it 'create a tweet' do
      post :tweet, params: { q: 'london', units: 'metric', lang: 'pt_br', appid: ENV['OPEN_WEATHER_MAP_APP_ID'] }

      expect(response).to have_http_status(:ok)
      expect(/[\d]+°C e [\w\s\p{L}]+ em [\w\s\p{L}]+ em (\d{2}\/\d{2}). Média para os próximos dias:( [\d]+°C em (\d{2}\/\d{2}),){4} [\d]+°C em (\d{2}\/\d{2})/).to match(JSON.parse(response.body)['message'])
    end

    it 'fail to create a tweet with an invalid city' do
      post :tweet, params: { q: 'ajnshd', units: 'metric', lang: 'pt_br', appid: ENV['OPEN_WEATHER_MAP_APP_ID'] }

      expect(response).to have_http_status(:not_found)
    end
  end
end
