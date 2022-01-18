#!/usr/bin/env bash

declare -a schemas=(
  v1.17.17
  v1.20.7
  v1.21.2
)
for version in "${schemas[@]}"
do
schema=https://raw.githubusercontent.com/kubernetes/kubernetes/${version}/api/openapi-spec/swagger.json
prefix=https://kubernetesjsonschema.dev/${version}/_definitions.json

openapi2jsonschema -o "${version}-standalone-strict" --kubernetes --stand-alone --strict "${schema}"
openapi2jsonschema -o "${version}-standalone" --kubernetes --stand-alone "${schema}"
openapi2jsonschema -o "${version}-local" --kubernetes "${schema}"
openapi2jsonschema -o "${version}" --kubernetes --prefix "${prefix}" "${schema}"
done