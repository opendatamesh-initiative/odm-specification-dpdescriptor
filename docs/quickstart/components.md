# Reusing Descriptions

As is often the case, the example built through the previous pages has grown too large to be easily manageable. This page introduces a mechanism to remove redundancy from a data product descriptor document by reusing portions of it.

## Components Object
The [Components Object](../resources/specifications/last.md#components-object), accessible through the `components` field in the root [Data Product Descriptor Entity](../resources/specifications/last.md#data-product-descriptor-entity), contains definitions for objects to be reused in other parts of the document.

TODO add image

Most objects in a data product descriptor document can be replaced by a **reference** to a **component**, drastically reducing the document’s size and maintenance cost (just like methods do in programming languages).

Not all objects can be referenced, though, only those listed as fields of the [Components Object](../resources/specifications/last.md#components-object) like `outputPorts`, `applicationComponents` and `infrastructuralComponents` to name a few.

Each field in the [Components Object](../resources/specifications/last.md#components-object) is a map pairing component names with objects to be reused. The type of these objects must match the parent field, e.g. objects in the `outputPorts` map must be [Output Port Components](../resources/specifications/last.md##output-port-component).

```json
{
    "components": {
        "applicationComponents": {
            "cdcIngestion": {
                "fullyQualifiedName": "urn:dpds:com.company-xyz:dataproducts:tripExecution:1:applications:cdcIngestion",
                "version": "1.0.1",
                "description": "The app that offload the Trip aggregate from  TMS using CDC",
                "platform": "aws:eu-south-1:debezium",
                "applicationType":"stream-sourcing"
            }
        },
         "infrastructuralComponents": {
            "eventStore": {
                "fullyQualifiedName": "urn:dpds:com.company-xyz:dataproducts:tripExecution:1:infrastructure:eventStore",
                "version": "1.0.1",
                "description": "The kafka topics topology required to store technical events offloaded from TMS by the CDC and the domain events generetaed by eventProcessor application",
                "platform": "aws:eu-south-1:confluent",
                "infrastructureType":"storage-resource"
            }
        }
    } 
}
```

The above example defines two components:

- `cdcIngestion` is an application component, usable wherever an [Application Component](../resources/specifications/last.md#applicationComponent) is expected.
- `eventStore` is an infrastructural component, usable wherever an [Infrastructural Component](../resources/specifications/last.md#infrastructure-component) is expected.

The next section explains how to reference these components.

## Reference Object
Any data product descriptor object of the types supported by the [Components Object](../resources/specifications/last.md#components-object) can be replaced by a [Reference Object](../resources/specifications/last.md#reference-object) pointing to a component.
[Reference Object](../resources/specifications/last.md#reference-object) is  [JSON](https://datatracker.ietf.org/doc/html/draft-pbryan-zyp-json-ref-03) resources](https://datatracker.ietf.org/doc/html/draft-pbryan-zyp-json-ref-03): they contain a  field named `$ref` and its string value is a URI pointing to the referenced object:

```json
{
    "internalComponents": {
        "applicationComponents": {
            "$ref": "#/components/applicationComponents/cdcIngestion"
        }, 
        "infrastructuralComponents": {
            "$ref": "#/components/infrastructuralComponents/eventStore"
        }
    }
}
```

Note how all resources point to different fragments inside the same document (the one being processed). The [Reference Object](../resources/specifications/last.md#reference-object) can be used also to point to external documents or events to fragment inside external documents.

```json
{
    "interfaceComponents": {
        "outputPorts": [
            {
                "$ref": "https://bitbucket.org/company-xyz/trip-execution/src/master/ports/output-ports.json#/tripEvents"
            }, {
                "$ref": "https://bitbucket.org/company-xyz/trip-execution/src/master/ports/output-ports.json#/tripStatus"
            }
        ]
    }
}
```

## Summary
Whenever the same piece of JSON or YAML is repeated in a data product descriptor document, it is probably worth converting it into a component and referencing it everywhere else.

Furthermore, [Reference Object](../resources/specifications/last.md#reference-object) allows splitting a document into several files to keep them organized and its size manageable.

This page has shown that:

- reusable [Reference Object](../resources/specifications/last.md#reference-object) can be defined by using the `components` field of the root [Data Product Descriptor Entity](../resources/specifications/last.md#data-product-descriptor-entity).
- Components can be referenced from any place where an object of the same type is expected using `$ref`.
- References are  URIs so they are very flexible.

<!--[The next page](./resources.md) explains how to include external resources in a data product descriptor document. #TODO -->



