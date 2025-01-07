# Annotation Schema Specification Quickstart

This guide provides a concise overview of the Annotation Schema Specification (SAS), helping you get started quickly.

---

## What is SAS?

Standard Annotation Schema (SAS) defines a framework for annotating schemas using a shared set of keywords. These annotations enrich schema definitions, enabling enhanced interoperability, validation, and clarity for datasets described in different Schema Definition Languages (SDLs).

---

## Key Concepts

### Schemas and Related Terms
- **Schema**: A machine-readable structure describing dataset organization.
- **Schema Annotation**: Metadata embedded in the schema for additional context.
- **Schema Annotation Specification**: A defined set of annotations used across schemas.

### Keywords and Vocabulary
- **Keyword**: An alphanumeric string used to annotate schema elements.
- **Vocabulary**: A collection of keyword definitions identified by a unique URI.


---

## Annotating a Schema

### Using Keywords
Keywords are central to schema annotations. Here’s an example of a JSON Schema annotated with SAS:

```json
{
  "type": "object",
  "sas": "1.0.0",
  "sasDialect": {
    "https://example.com/custom-vocabulary": { "prefix": "custom.", "required": false }
  },
  "custom.author": "Andrea",
  "properties": {
    "temperatures": {
      "type": "array",
      "items": {
        "type": "number",
        "custom.unit": "Celsius"
      }
    }
  }
}
```

### Using Dialects
Dialects define which vocabularies are in use. Example:

```json
{
  "sasDialect": {
    "https://example.com/vocabulary-1": { "prefix": "v1.", "required": false },
    "https://example.com/vocabulary-2": { "prefix": "v2.", "required": true }
  }
}
```

---

## Supported Schema Definition Languages (SDLs)

### JSON Schema
Annotations are any unrecognized keywords.

Example:
```json
{
  "type": "object",
  "author": "Andrea",
  "properties": {
    "sensor": { "type": "string" }
  }
}
```

### Avro
Annotations are treated as metadata.

Example:
```json
{
  "type": "record",
  "name": "TemperatureData",
  "author": "Andrea",
  "fields": [
    { "name": "temperature", "type": "double", "unit": "Celsius" }
  ]
}
```

### Protobuf
Annotations use custom options.

Example:
```proto
syntax = "proto3";
import "custom-options.proto";

message Data {
  option (author) = "Andrea";
  repeated double temperatures = 1 [(unit) = "Celsius"];
}
```

---

## Defining Keywords

Each keyword should include:

- **Name**: The keyword itself (e.g., `author`).
- **Value Type**: e.g., `string`, `number`.
- **Description**: Context or intended use.
- **Best Practices**: Recommendations for use.

---

## Best Practices

- **Use Alphanumeric Keywords**: Avoid special characters unless necessary.
- **Define Dialects**: Specify vocabularies in the `sasDialect` keyword.
- **Validate and Test**: Use SDL-specific tools to verify annotations.

---

## Example: Complete Annotated Schema

Here’s an example of a fully annotated JSON Schema:

```json
{
  "type": "object",
  "sas": "1.0.0",
  "sasDialect": {
    "https://example.com/vocabulary": { "prefix": "vocab.", "required": false }
  },
  "vocab.author": "Andrea",
  "properties": {
    "sensor": {
      "type": "object",
      "properties": {
        "id": { "type": "string" },
        "location": { "type": "string" }
      }
    }
  },
  "required": ["sensor"]
}
```

---

## Next Steps

1. **Define Custom Keywords**: Extend SAS for your use case.
2. **Use Provided Examples**: Start annotating schemas with JSON, Avro, or Protobuf.
3. **Reference Dialects**: Utilize existing vocabularies for interoperability.

For more details, refer to the full [SAS Specification](https://github.com/opendatamesh-initiative/odm-specification-schema-annotations/blob/main/versions/1.0.0-DRAFT.md).

---

Happy annotating!
