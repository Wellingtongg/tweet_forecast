## Installation

```bash
$ bundle install
```

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