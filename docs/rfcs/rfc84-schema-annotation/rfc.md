# Title

Champion: @andrea-gioia 

## Summary
A dataset schema is the definition of how data is organized within a dataset. Schema definition can be used to validate shared data structure (schema validation), annotate data structure with metadata (schema annotation), or create the data structure on a specific datastore (schema creation or data definition language).

In DPDS dataset schemas are used to describe the data shared by ports. The schema definition is not part of the specification. It is delegated to the specification used to describe the API of the specific port. The schema definition format depends on the format used by the API specification to serialize exchanged data. The following tables show some commonly used schema definition format

Schema definition format | Data serialization format  
---|:---
[JSON Schema](https://json-schema.org/) | JSON 
[YAML Schema](https://asdf-standard.readthedocs.io/en/1.0.3/schemas/yaml_schema.html) | YAML
[AVRO Schema](https://avro.apache.org/docs/1.11.1/specification/) | AVRO
[XML Schema Definition](https://www.w3.org/TR/xmlschema11-1/) | XML

We want to define a sub-specification of DPDS to standardize the way schemas are annotated.


## Motivation
Through schema annotation is possible to provide metadata to describe the underlying data beyond the way it is structured.  Examples of information that can be encoded through schema annotations are:
* human-readable descriptions of the dataset and its field
* data usage guidelines
* technical information on how data is stored
* constraints on data exchanged that can be then converted into quality checks
* how the dataset and its fields can be linked to external datasets (syntactic linking)
* how the dataset and its fields can be linked to external ontologies (semantic linking)

While each schema definition format has different modalities for defining annotations, it's important to define a common vocabulary for the information that can be used to enrich the schema definition. In other words, defining the admissible annotations and their meaning is important.

Describing the schema of a dataset using standard schema definition format and annotations is better than defining a custom structure to store schema metadata for the following reasons:
* it is possible to have only one schema for serialization, validation, and metadata
* metadata is embedded in the schema shared between producer and consumers. Once the consumer gets the schema gets also its metadata no matter what tool manages the schema repository
* Using standard schema format permits leveraging the ecosystem of tools supporting the format (e.g., validator, linter, registry, gift, etc.).


## Design and examples

```json
{
  "sasDialect": {
    "https://www.dublincore.org/specifications/dublin-core/dcmi-terms": {
	  "prefix":"dct.", 
	  "escludedKeywords": ["conformsTo"],
	  "required":false
	},
    "https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema": {
	  "prefix":"bitol.",
	  "aliases": {"businessName": ["title"]},
	  "required":false
    }
  },

  "type": "object",

  "properties": {
    "coutryCode": {
        "type": "string",
        "bitol.title": "Country Code",
        "bitol.maxLength": 2,
        "dct.conformsTo": "ISO3166-2"
    }
  }
}
```

## Alternatives

Define custom way to define metadata separated from schema definition.

## Decision

We decided to create a dedicate sub-specification named [Schema Annotation Specification](https://github.com/opendatamesh-initiative/odm-specification-schema-annotations/tree/main).

## Consequences

The Schema Annotation Spedification SHOULD be used to specify all dataset metadata.

## References

[Schema Annotation Specification](https://github.com/opendatamesh-initiative/odm-specification-schema-annotations/tree/main)
