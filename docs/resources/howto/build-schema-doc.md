# How to build JSON schema documentation

[JSON Schemas](../schemas/README.md) are useful for validating the descriptors produced against the corresponding [Specification](../specifications/README.md).

Reading a JSON Schema directly can be tough, so it can be useful to introduce a tool that represents the schema in a more human-readable format.

We use <a href="https://coveooss.github.io/json-schema-for-humans" target="_blank">JSON Schema for Humans:octicons-link-external-24:</a> which can quickly generate a beautiful static HTML or Markdown page documenting a JSON schema.

## Setup

JSON Schema for Humans can be installed through pip with a single command:

```shell
pip install json-schema-for-humans
```

## Editing

We suggest to use a working copy of the schema instead of editing the principal version itself.

The working copy we use is named `schema-dev.json` and it is located under the respective `schemas/<version>` folder but any other file can serve the same purpose.

After editing the schema we proceed with a placeholders substitution in order to create the file `schema.json` in the same folder.

!!! example "WIP"

    We are working on a more robust and comprehensive script to automatize these steps.

## Building

In order to recreate the HTML documentation of the JSON Schema the following command can be launched from a `schemas/<version>` folder:

```shell
generate-schema-doc --config-file docs/config.yaml schema.json docs/html
```

!!! example "WIP"

    We are working on a more robust and comprehensive script to automatize these steps.

## Publishing

To update the JSON Schema version published on the site, the HTML page published in `schemas/<version>/docs/html` named `schema.html` must be moved under the main `docs/schema` folder. 

!!! example "WIP"

    We are working on versioning the content of this folder. 

    We are working on a more robust and comprehensive script to automatize these steps.