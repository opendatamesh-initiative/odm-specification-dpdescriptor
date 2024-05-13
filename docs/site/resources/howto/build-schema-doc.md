# How to build JSON schema documentation

[JSON Schemas](../schemas/README.md) are useful for validating the descriptors produced against the corresponding [Specification](../specifications/README.md).

Reading a JSON Schema directly can be tough, so it can be useful to introduce a tool that represents the schema in a more human-readable format.

We use <a href="https://coveooss.github.io/json-schema-for-humans" target="_blank">JSON Schema for Humans:octicons-link-external-24:</a> which can quickly generate a beautiful static HTML or Markdown page documenting a JSON schema.

## Setup

JSON Schema for Humans can be installed through pip with a single command:

```shell
pip install json-schema-for-humans
```
!!! note 

    If you used the `setup.sh` script described in [How to build the site](./build-site-doc.md#setup) you already installed it.


## Editing

We suggest using a working copy of the schema instead of editing the principal version itself.

The working copy we use is named `schema-dev.json` and it is located under the respective `schemas/<version>` folder but any other file can serve the same purpose.

After editing the schema we proceed with a placeholders substitution in order to create the file `schema.json` in the same folder.

!!! tip 

    It is possible to manage the substitution using `update-schema.sh` in `scripts` folder specifying the version number and declaring if it is the latest.

## Building

In order to recreate the HTML documentation of the JSON Schema the following command can be launched from a `schemas/<version>` folder:

```shell
generate-schema-doc --config-file docs/config.yaml schema.json docs/html
```

!!! tip 

    It is possible to build JSON html using `build-schema-doc.sh` in `scripts` folder specifying the version number and declaring if it is the latest.

## Publishing

To update the JSON Schema version published on the site, the HTML page published in `schemas/<version>/docs/html` named `schema.html` must be moved under the main `docs/schema` folder. 

!!! tip 

    It is possible to publish JSON html in the main docs using `deploy-schema-doc.sh` in `scripts` folder specifying the version number and declaring if it is the latest.

## Wrap Up

!!! tip 
    
    Perform all the previously descripted steps with just one script using `full-schema-lifecycle.sh` specifying the version number and declaring if it is the latest.
    
    Use the `-h` option to get a complete list of the accepted options.



