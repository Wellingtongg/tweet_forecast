class OpenWeatherMapService
  class << self
    def get_forecast(options = {})
      @path = "forecast"
      @query = build_query(options)
      begin
        if response.is_a?(Net::HTTPSuccess)
          return JSON.parse(response.body)
        end
      rescue => err
        Rails.logger.info("[OpenWeatherMapService - get_forecast] Error: #{err.inspect}")
        return nil
      end
    end

    def get_weather(options = {})
      @path = "weather"
      @query = build_query(options)
      begin
        if response.is_a?(Net::HTTPSuccess)
          return JSON.parse(response.body)
        end
      rescue => err
        Rails.logger.info("[OpenWeatherMapService - get_weather] Error: #{err.inspect}")
        return nil
      end
    end

    private

    def build_query(options)
      query = ""
      options.each do |key, value|
        query += "#{key}=#{value}&"
      end
      query
    end

    def uri
      URI::HTTPS.build(
        host: "api.openweathermap.org",
        path: "/data/2.5/#{@path}",
        query: "#{@query}appid=#{ENV['OPEN_WEATHER_MAP_APP_ID']}"
      )
    end

    def response
      response = Net::HTTP.start(uri.host, use_ssl: true) do |http|
        http.request(request)
      end
    end

    def request
      Net::HTTP::Get.new(uri)
    end
  end
end