Script to fetch metadata prefixes from CLARIN metadata providers (B and C centres).
See [https://jira.eosc-hub.eu/browse/EOSCWP10-48](https://jira.eosc-hub.eu/browse/EOSCWP10-48)

# Dependencies

 * bash 

The following tools/commands will be assumed to be available in the shell environment:

 * [curl](https://github.com/curl/curl)
 * [jq](https://stedolan.github.io/jq)
 * [yq](https://github.com/kislyuk/yq)
 
Let's assume you have bash and curl. On MacOS, install jq and yq using 
[Brew](https://brew.sh/) with the following command:

```sh
brew install yq
```

# Running

Run the script with bash:
```sh
bash oai-endpoints-get-formats.sh
```