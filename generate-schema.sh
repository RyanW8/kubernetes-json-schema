#!/usr/bin/env bash
pip3 install openapi2jsonschema
openapi2jsonschema -o "$1-standalone-strict" --kubernetes --stand-alone --strict https://raw.githubusercontent.com/kubernetes/kubernetes/$1/api/openapi-spec/swagger.json