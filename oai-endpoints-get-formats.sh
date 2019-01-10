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
	get_endpoints
}

#########################################################################################
# Gets OAI-PMH endpoints from the centre registry
#########################################################################################
get_endpoints() {
	curl -sL "${ENDPOINT_INFO_URL}"|jq '.[]|.fields.uri'
}

# Run main
main $@
