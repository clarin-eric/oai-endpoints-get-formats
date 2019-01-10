#!/usr/bin/env bash
#
# Script to retrieve 
#
######

API_URL="https://centres.clarin.eu/api"
ENDPOINT_INFO_URL="${API_URL}/model/OAIPMHEndpoint"

# Define functions

#########################################################################################
# Main
#########################################################################################
main() {
	get_endpoints | {
		while read ENDPOINT; do
			get_formats_for_endpoint $ENDPOINT
		done
	} | jq -s # combine into a json array
}

#########################################################################################
# Gets OAI-PMH endpoints from the centre registry
#########################################################################################
get_endpoints() {
	curl -sL "${ENDPOINT_INFO_URL}" | \
		jq '.[]|.fields.uri' | \
		sed -e 's/\"\(.*\)"$/\1/g'
}

#########################################################################################
# Gets formats from the specified endpoint and turns this into a json object
#########################################################################################
get_formats_for_endpoint() {
	ENDPOINT=$1
	jq -n '{
		uri: "'"${ENDPOINT}"'",
		formats: ["",""]
	}'
}

# Run main
main $@
