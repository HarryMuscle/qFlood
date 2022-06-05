# qFlood Docker Image

Docker image based on the [hotio/qflood](https://github.com/hotio/qflood) image with the following changes:

- run on Kubernetes (ie: TrueNAS Scale) without requiring privileged mode
- run a second instance of Flood with a different configuration directory called "flood-2" (the FLOOD_AUTH and FLOOD_ARGS environment variables are shared between both instances of Flood and the UI port for the second instance of Flood is specified via the middle port in the WEBUI_PORTS environment variable due to how the existing applications are setup (qBittorrent uses the first port and the original instance of Flood uses the last port specified in the WEBUI_PORTS environment variable))
- ...
