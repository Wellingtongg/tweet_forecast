## Installation

```bash
$ bundle install
```

## ENV

add to your `.env` file
```
TWITTER_API_KEY=<YOUR API KEY>
TWITTER_API_KEY_SECRET=<YOUR API KEY SECRET>
TWITTER_ACCESS_TOKEN=<YOUR ACCESS TOKEN>
TWITTER_ACCESS_TOKEN_SECRET=<YOUR ACCESS TOKEN SECRET>

OPEN_WEATHER_MAP_APP_ID=<YOUR APP ID>
```

*The OPEN_WEATHER_MAP_APP_ID will be used just in the test*

## Run server

```bash
$ rails s
```

## Test

```bash
$ bundle exec rspec
```

## Endpoints

`weather/tweet`

```curl
curl --request POST \
  --url http://localhost:3000/weather/tweet \
  --header 'Content-Type: application/json' \
  --data '{
		"q": "florianopolis",
		"units": "metric",
		"lang": "pt_br",
		"appid": "XXXXXX"
	}'
```

*The props for this response is provided on [open_weather_map_api](https://github.com/Wellingtongg/open_weather_map_api)*