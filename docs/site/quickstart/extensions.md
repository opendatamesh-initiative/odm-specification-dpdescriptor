# Extending the specification

The [Data Product Descriptor Specification (DPDS)](../overview/README.md) can be customized to your needs in different ways. This page describes the key extension points provided by DPDS.

## Use an external specification
For all components of a data product descriptor documents that can be better defined by a dedicated specification or an existing standard, DPDS does not try to reinvent the wheel.  It allows you to define the specific component using the external specification you prefer, even a custom one. 

Through the [Standard Definition Object](../resources/specifications/last.md#standard-definition-object) it is possible to describe a component in a data product descriptor document,  using an external specification or standard.  These are the mandatory fields of the [Standard Definition Object](../resources/specifications/last.md#standard-definition-object):

- `specification` (**string**): The unique name of the specification used (ex. OpenAPI, AsyncAPI, DatastoreAPI, etc....)
- `definition` (**string** or [Reference Object] or [External Resource Object]): The definition of the given component compliant with the specification defined in the `specification` field.

Even if not mandatory it is RECOMMENDED to specify also the used specification version through the `version` field. If this field is not specified the specification version MUST be included in the definition itself.

The [Standard Definition Object](../resources/specifications/last.md#standard-definition-object) can be extended with other fields with **"x-" prefix** as needed.

???+ note 
    In the current release of DPDS the [Standard Definition Object](../resources/specifications/last.md#standard-definition-object) is used to define API of services exposed by the data product.

The following example shows an output port component that exposes streaming services and uses <a href="https://www.asyncapi.com/docs/reference/specification/v2.5.0" target="_blank">version 2.5.0 of AsyncAPI specification :octicons-link-external-24:</a> to define them. 

```json
{
    "fullyQualifiedName": "urn:dpds:com.company-xyz:dataproducts:tripExecution:1:outputports:tripEvents",
    "name": "tripEvents",
    "displayName": "Trip Events",
    "description": "This port exposes a *stream of events* related to the `Trip` entity",
    "version": "1.2.0",
    "promises": {
        "platform": "westeurope.azure:confluent",
        "serviceType": "streaming-services",
        "api": {
            "specification": "asyncapi",
            "version": "2.5.0",
            "definition": {
                "mediaType": "text/json",
                "$href": "https://github.com/opendatamesh-initiative/odm-specification-dpdescriptor/blob/main/examples/tripexecution/ports/trip-events-oport-api.json"
            },
            "externalDocs": {
                "description": "The AsyncAPI v2.5.0 specification used to define the API of this port",
                "mediaType": "text/html",
                "$href": "https://www.asyncapi.com/docs/reference/specification/v2.5.0"
            }
        },
        ...
    },
    ...
}
```

## Adding custom fields
Almost all components of a data product descriptor document can be extended with other fields with **"x-" prefix** as needed. The prefix is required to avoid possible conflict with future versions of the specification. Tools compliant with the specification CAN or CANNOT properly manage a custom field.
