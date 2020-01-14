# heroku-buildpack-spiped

[spiped](https://github.com/Tarsnap/spiped) provides symmetrically encrypted
and authenticated pipes over TCP between socket addresses. Essentially, it
allows you to tunnel insecure protocols to a target over an encrypt and
authenticated socket.

Common uses include:
- [Securing Redis communication](https://redis.io/topics/encryption)
- Statsd over TCP

## Status :warning: :rotating_light:

This buildpack is in early development and (while it may work) the environment
variables and usage may change and break your application.

## Thanks

The development and continued support for this buildpack is sponsored by 
[Dead Man's Snitch](https://deadmanssnitch.com).

Ever been surprised that a critical cron job or scheduled task was silently
failing to run? Whether it's backups, cache clearing, or sending invoices, Dead
Man's Snitch makes it easy to [monitor heroku scheduler](https://deadmanssnitch.com/docs/heroku)
tasks or [cron jobs](https://deadmanssnitch.com/docs/cron-job-monitoring) to
give you the confidence they're running when and how they should.

Get started for free today with [Dead Man's Snitch on Heroku](https://elements.heroku.com/addons/deadmanssnitch)

## Install

```console
heroku buildpacks:add https://github.com/deadmanssnitch/heroku-buildpack-spiped
git push heroku master
```

### Creating a key

```console
dd if=/dev/urandom bs=32 count=1 status=none of=key
heroku config:set SPIPED_KEY="$(base64 -w0 key)"
```

## Usage

## Configuration

### SPIPED_ENABLED

Set to true to automatically enable an spiped connection based on

```console
heroku config:set SPIPED_ENABLED=true
```

### SPIPED_KEY

Base64 encoded encryption key.

```console
heroku config:set SPIPED_KEY="$(base64 -w0 key)"
```

### SPIPED_TARGET

Address to which spiped should connect.  Must be in one of the following formats:

* `/absolute/path/to/unix/socket`
* `host.name:port`
* `[ip.v4.ad.dr]:port`
* `[ipv6::addr]:port`

### SPIPED_SOURCE

Address  on  which  spiped should listen for incoming connections.

* `/absolute/path/to/unix/socket`
* `host.name:port`
* `[ip.v4.ad.dr]:port`
* `[ipv6::addr]:port`
