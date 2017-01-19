# StatsD + 🐳

All the other statsd images were fairly specialized. This one is not, All it does is run [`statsd`](https://github.com/etsy/statsd).

To test it out (will run in `debug` with `dumpMessages:true`):
```
$ docker run --rm --publish=8125:8125 --publish=8125:8125/udp quay.io/lumoslabs/statsd
```

To run it for real, provide it a `config.js` at `/config/config.js`:
```
$ docker run --rm --publish=8125:8125 --publish=8125:8125/udp --volume=my-config.js:/config/config.js quay.io/lumoslabs/statsd
```
