# Interface Components

[The previous page](./info.md) showed the minimal structure of a data product descriptor document but did not add any public interface to the data product. This page explains how to do it.

## Interface Components Object
Data product interface components are called **ports** in the DPDS. The [Interface Components Object](../resources/specifications/last.md#interfaceComponentsObject), accessible through the `interfaceComponents` field in the root [Data Product Descriptor Entity](../resources/specifications/last.md#data-product-descriptor-entity), is the container for all ports exposed by the data product.  


![open-data-mesh descriptor components](../images/dpds-interface-components.svg)

### Fileds
The [Interface Components Object](../resources/specifications/last.md#interfaceComponentsObject) has five fields, one for each port type: `inputPorts`, `outputPorts`, `discoveryPorts`, `observabilityPorts` and `controlPorts`. Because a data product can expose multiple ports of the same type all these fields are an  **Array of Objects**. The type of these objects depends on the specific port type: [Input Port Component](../resources/specifications/last.md#input-port-component), [Output Port Component](../resources/specifications/last.md#output-port-component), [Discovery Port Component](../resources/specifications/last.md#discovery-port-component), [Observability Port Component](../resources/specifications/last.md#observability-port-component) and [Control Port Component](../resources/specifications/last.md#control-port-component). Anyway, all these objects share a common subset of fields, no matter what it is the type of port to which they are associated. The most important of these shared fields are:

- `fullyQualifiedName` (**string:fqn**): The unique universal identifier of the port. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:{port-type}:{port-name}`
- `version`: (**string:version**): This is the <a href="https://semver.org/spec/v2.0.0.html" target="_blank">semantic version number</a> of the data product's port. Every time the *major version* of port changes also the *major version* of the product MUST be incremented.
- `promises` ([Promises Object](../resources/specifications/last.md#promises-object)): These are the data product's [promises](../concepts/data-contract.md) declared over the port.
- `expectations` ([Expectations Object](../resources/specifications/last.md#expectations-object)): These are the data product's [expectations](../concepts/data-contract.md) declared over the port.
- `obligations` ([Obligations Object](../resources/specifications/last.md#obligations-object)): These are the data product's [obligations](../concepts/data-contract.md) declared over the port.

### Example
Here is a first example snippet of a port definition. More details on how to valorize `promises`, `expectations` and `obligations` fields are provided in the next subsections.

```json
{
	"fullyQualifiedName": "urn:dpds:com.company-xyz:dataproducts:tripExecution:1:outputports:tripStatus",
	"name": "tripStatus",
	"displayName": "Trip Status",
	"description": "The last known status of each trip operated in the last 12 months",
	"version": "1.2.0",
	"promises": {...},
	"expectatctions": {...},
	"obligations": {...}
}
```
## Promises Object
Through promises, the data product declares the intent of the port. It's a set of implicit agreements between the data product and its consumers. 

### Fields
A [Promises Object](../resources/specifications/last.md#promises-object) is composed by the following fields:

- `platform` (**string**): This is the target technological platform in which the services associated with the given port operate. Examples: `onprem:milan-1`, `aws:eu-south-1`, `aws:eu-south-1:redshift`.
- `servicesType` (**string**): This is the type of service associated with the given port. Examples: `soap-services`, `rest-services`, `odata-services`,`streaming-services`, `datastore-services`.
- `api` ([Standard Definition Object](../resources/specifications/last.md#standardDefinitionObject)): this is the formal description of services API. A good API standard specification should describe how to define the following elements of the service interface: addressable endpoints, available authentication methods and schema of data object exchanged.
	- `specification` (**string**): This is the name of the specification used to define the service API. It is RECOMMENDED to use [Open API Specification](https://github.com/OAI/OpenAPI-Specification) for restful services, [Async API Specification](https://github.com/asyncapi/spec) for streaming services and *DataStore API Specification* for data store connection-based services. Other specifications MAY be used as required.
	- `specificationVersion` (**string**): This is the version of the specification used to define the service API.
	- `definition` (**Object**): This is the definition of the service API built using the specification reported in the fields above
- `depreceationPolicy` ([Standard Definition Object](../resources/specifications/last.md#standardDefinitionObject)): This is the deprecation policy adopted for the given set of services. 
- `slo`: ([Standard Definition Object](../resources/specifications/last.md#standardDefinitionObject)): These are the _service_ level objectives (SLO)* supported by the given set of services. 

The [Promises Object](../resources/specifications/last.md#promises-object) can be extended with other fields with **"x-" prefix** as needed.

### Example
The promises of the following example describe a datastore service that exposes one table (i.e. `trip_status`) composed of two columns (i.e. `id` and `status`) stored on a *Postgress DB* hosted in *AWS Cloud*. The description of the API is provided using a custom standard that is a simplified version of the *DataStore API Specification*. Both `depreceationPolicy` and `slo` fields use a custom specification to provide more info respectively on the deprecation period duration (i.e. `x-deprecation-period`) and the service level indicators supported (i.e. `x-operationalSlo`  and `x-qualitySlo`)

```json
{
	"platform": "aws:eu-south-1:postgres",
	"serviceType": "datastore-services",
	"api": {
            "name": "tripStatusApi",
            "version": "1.0.0",
            "specification": "datastoreapi",
            "specificationVersion": "1.0.0",
            "definition": {
                "mediaType": "text/json",
                "$ref": "trip-status-oport-api.json"
            },
            "externalDocs": {
                "description": "The OpenAPI v3.1.0 specification used to define the API of this port",
                "mediaType": "text/html",
                "$href": "https://spec.openapis.org/oas/v3.1.0"
            }
        },
        "deprecationPolicy": {
            "name": "policy",
            "version": "1.0.0",
            "specification": "custom",
            "description": "When a new major version become available the previous one is kept online for 3 months",
            "definition": {
                "x-deprecation-period": "3M"
            }
        },
        "slo": {
            "name": "slo",
            "version": "1.0.0",
            "specification": "custom",
            "description": "The slo are hight for all base service indicators because this service is business critical",
            "definition": {
                "x-operationalSlo": {
                    "availability": "0.99999",
                    "responsetime": "1s"
                },
                "x-qualitySlo": {
                    "freshness": "5m"
                }
            }
        }
    }
```

## Expectations Object
Through expectations, the data product declares how it wants the port to be used by its consumers. Expectations are the inverse of promises. They are a way to explicitly state what promises the data product would like consumers to make regarding how they will use the port. 

### Fields
An [Expectations Object](../resources/specifications/last.md#expectations-object) is composed of the following fields:

- `audience` ([Standard Definition Object](../resources/specifications/last.md#standardDefinitionObject)): This is the audience of consumers for whom the port has been designed. 
- `usage` ([Standard Definition Object](../resources/specifications/last.md#standardDefinitionObject)): These are the usage patterns for which the port has been designed. 

The [Expectations Object](../resources/specifications/last.md#expectations-object) can be extended with other fields with **"x**-" prefix** as needed.

### Example
The expectations of the following example describe a data store service that has been designed to serve the operations department and not the customer service and finance department. It is also expected that the service is consumed for operational and not analytical workloads. Queries must be filtered on the *id* of the *trip*. Unfiltered selections and queries with *group-by clauses* are not expected to occur.

```json
{
    {
        "audience": {
            "name": "audience",
            "version": "1.0.0",
            "specification": "custom",
            "description": "This port is designed to help operations departments. It is not for customer care and finance departments",
            "definition": {
                "x-includes": [
                    "operations"
                ],
                "x-excludes": [
                    "customer-care",
                    "finance"
                ]
            }
        },
        "usage": {
            "name": "usage",
            "version": "1.0.0",
            "specification": "custom",
            "description": "This port is designed to operational access not for analysis",
            "definition": {
                "x-filterOn": [
                    "id"
                ],
                "x-forbiddenOperations": [
                    "group-by",
                    "unfiltered-selections"
                ]
            }
        }
    }
```

## Obligations Object
Through obligations, the data product declares promises and expectations that must be respected by the data product and its consumers. An obligation is an explicit agreement between the data product and its consumers. It is used to group all the promises and expectations that if not respected can generate penalties like monetary sanctions or interruption of service.

### Fields
A [Obligations Object](../resources/specifications/last.md#obligations-object) is composed of the following fields:

- `termsAndConditions` ([Standard Definition Component](../resources/specifications/last.md#standard-definition-component)): These are the terms and conditions defined on the port on which consumers must agree to use it. 
- `billingPolicy` ([Standard Definition Component](../resources/specifications/last.md#standard-definition-component)): This is the billing policy defined on the port on which consumers must agree to use it. 
- `sla`	([Standard Definition Component](../resources/specifications/last.md#standard-definition-component)): These are the *service level agreements (SLA)* supported by the port. 

The [Obligations Object](../resources/specifications/last.md#obligations-object) can be extended with other fields with **"x-" prefix** as needed.

### Example
The obligations of the following example describe a datastore service billed monthly 0.001$ for each million executed queries. Terms and conditions of service are described in the internal wiki. A link to the specific session is provided, Finally, the values of supported SLA are reported together with a link to the wiki page that describes the base service level indicators that each data product must support.

```json
{
        "termsAndConditions": {
            "name": "termsAndConditions",
            "version": "1.0.0",
            "specification": "custom",
            "description": "A detailed description of the data product, that include also the target audience",
            "definition": {},
            "externalDocs": {
                "mediaType": "text/html",
                "$href": "https://wiki.example-xyz.com/corporate-mesh/dp/trip-execution.html#terms-and-conditions"
            }
        },
        "billingPolicy": {
            "name": "billingPolicy",
            "version": "1.0.0",
            "specification": "custom",
            "description": "This port is billed by number of monthly queries",
            "definition": {
                "x-billingUnit": "milion queries",
                "x-pricePerUnit": 0.01,
                "x-billingPeriod": "month"
            }
        },
        "sla": {
            "name": "sla",
            "version": "1.0.0",
            "specification": "custom",
            "description": "The sla are hight for all base service indicators because this service is business critical",
            "definition": {
                "x-operationalSla": {
                    "availability": "0.999",
                    "responsetime": "5s"
                },
                "x-qualitySla": {
                    "freshness": "10m"
                }
            }
        }
    }
```

## Trip Execution Data Product Descriptor
The [Trip Execution Data Product](./example.md) has one input port and two output ports.

The following files contain the complete definition of these ports:

- <a href="https://github.com/opendatamesh-initiative/odm-specification-dpdescriptor/blob/main/examples/tripexecution/ports/trip-tms-iport.json" target="_blank">trip-tms-iport.json (coming soon) :fontawesome-brands-github:</a>
- <a href="https://github.com/opendatamesh-initiative/odm-specification-dpdescriptor/blob/main/examples/tripexecution/ports/trip-events-oport.json" target="_blank">trip-events-oport.json :fontawesome-brands-github:</a>
- <a href="https://github.com/opendatamesh-initiative/odm-specification-dpdescriptor/blob/main/examples/tripexecution/ports/trip-status-oport.json" target="_blank">trip-status-oport.json :fontawesome-brands-github:</a>

You can read them on GitHub or cut and paste the content of the JSON files to <a href="https://jsoncrack.com/editor" target="_blank">JSON Crack :octicons-link-external-24:</a> for more interactive visualization.

## Summary
This page has shown that:

- DPDS groups services exposed by a data product in ports. 
- Five types of ports are supported by DPDS: input port, output port, discovery port, observability port and control port.
- The description of the interface of all ports exposed by a data product is contained in the [Interface Components Object](../resources/specifications/last.md#interfaceComponentsObject).
- each data product can have multiple ports of the same type.
- the interface of each port, independent of the specific type, is described through `promises`, `expectations` and `obligations` fields.

[The next page](./application.md) describes the contents of the `applicationComponents` field used to provide all the required information to build and deploy applications that implement the services exposed by the product through its ports.
