# slow-lane
Control speed, content type and data length for streaming data

## Live demo
https://slowlane.ciancode.com/stream.png?c=20&d=0.2


## URL Params:
| Param                  | Default                  | Description                         |
|------------------------|--------------------------|-------------------------------------|
| `ct` or `content_type` | `text/plain`             | Sets the response HTTP header       |
| `c` or `count`         | `10`                     | Sets number of lines to be returned |
| `d` or `delay`         | `0.4`                    | Sets the delay between each line    |
| `t` or `text`          | Random 64 hex characters | Sets the text to be returned        |


## Running locally with rerun
```sh
bundle exec rerun --background --dir . --pattern '{*}' -- bundle exec ruby slow_lane.rb
```
