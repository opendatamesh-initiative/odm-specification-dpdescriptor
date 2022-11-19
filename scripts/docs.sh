#!/bin/bash

command=/home/andrea.gioia/.local/bin/generate-schema-doc
schemadir=./schemas/v1.0
docsdir=$schemadir/docs
schemadev=schema-dev.json
schema=schema.json

sed 's,SPEC-BASE-URL,https://bitbucket.org/quantyca/odm-specification-dpdescriptor/src/f969d5683f8801da50347a8b0242772204497c7d/versions/1.0.0.md,g' $schemadir/$schemadev > $schemadir/$schema
$command --config template_name=js --config-file $docsdir/config.yaml $schemadir/$schema $docsdir/html
$command --config template_name=md --config-file $docsdir/config.yaml $schemadir/$schema $docsdir/md