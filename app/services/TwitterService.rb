require 'twitter'

class TwitterService
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_KEY_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  def tweet_forecast(forecast)
    tweet(format_forecast_message(forecast))
  end

  def tweet(message)
    response = @client.update(message)
    {
      message: message,
      tweet: response
    }
  end

  private

  def format_forecast_message(forecast)
    forecast_per_day = {}
    forecast["list"].each do |item|
      day_formatted = item["dt_txt"].to_date.strftime("%d/%m")

      if forecast_per_day[day_formatted].present?
        forecast_per_day[day_formatted] << item
      else
        forecast_per_day[day_formatted] = [item]
      end
    end
  
    current_weather = forecast_per_day.values.first
    message = "#{average_temperature(current_weather)}°C e #{current_weather.first["weather"].first["description"].capitalize} em #{forecast["city"]["name"]} em #{forecast_per_day.keys.first}."

    forecast_per_day.delete(forecast_per_day.keys.first)

    forecast_per_day.each.with_index do |(date, item), index|
      if index == 0
        message += " Média para os próximos dias:"
      end

      if index != 0
        message += ","
      end

      message += " #{average_temperature(item)}°C em #{date}"

      if index == forecast_per_day.size - 1
        message += "."
      end
    end

    message
  end

  def average_temperature(forecast)
    (forecast.map{ |v| v["main"]["temp"] }.reduce(:+) / forecast.size).round(0)
  end
end