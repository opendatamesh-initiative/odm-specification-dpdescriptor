# External Resource

[The previous page](./components.md) showed how the specification allows substituting the inline definition of some parts of a data product descriptor document with a [Reference Object](../resources/specifications/last.md#reference-object) pointing to a definition stored in the `components` field of the [Data Product Descriptor Entity](../resources/specifications/last.md#data-product-descriptor-entity) or even in an external file. This page explains how to reference an external resource used to describe the data product but that is not part of the specification (ex. external documentation, images, definitions compliant with other specifications). 

## External Resource Object
Some fields defined by the specification point to an external resource that is used to define the data product but is not part of the specification itself. These fields are of the type [External Resource Object](../resources/specifications/last.md#external-resource-object) and define all the information required to access the referred external resource.

### Fields
An [External Resource Object](../resources/specifications/last.md#applicationComponent) has the following mandatory fields:

- `$href` (**string:uri**): The URI of the target resource. It must conform to the URI format, according to <a href="https://www.rfc-editor.org/rfc/rfc3986" target="_blank">RFC3986 :octicons-link-external-24:</a>

Other non-mandatory descriptive fields like `description` and `mediaType` are also available. Moreover, the [External Resource Object](../resources/specifications/last.md#external-resource-object) can be extended with other fields with **"x-" prefix** as needed.

### Example
The following example shows a `termsAndConditions` filed that points to an external web page that contains all the contractual terms and conditions related to the data product usage

```json
{

    "termsAndConditions": {
        "externalDocs": {
        	"mediaType": "text/html",
            "$href": "https://wiki.example-xyz.com/corporate-mesh/dp/trip-execution.html#terms-and-conditions"
        }
    }
}
```

## Summary
This page has shown that:

- DPDS can point to external resources whose content is not defined in the specification itself. Agents compliant with the specification can or cannot be able to manage properly these resources.

The [next page](./docs.md) describes how to include documentation in the data product descriptor.