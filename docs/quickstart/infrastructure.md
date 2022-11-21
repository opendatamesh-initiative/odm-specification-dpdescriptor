# Infrastructural Components

[The previous page](./application.md) showed how to define the [application components](../concepts/README.md#application-components) that implement the services exposed by a [data product](../concepts/README.md#data-product) through its *ports*. This page explains how to define the [infrastructural components](../concepts/README.md#infrastructural-components) required to execute these applications.

## Infrastructural Component Object

Infrastructural components are internal components of a data product. This mean that, while the interface components are publicly available on demand to all consumers, access to infrastructural components can be restricted.

All internal components of a data product are contained in the [Internal Components Object](../resources/specifications/1.0.0-DRAFT.md#internalComponentsObject), accessible through the `internalComponents` field in the root [Data Product Descriptor Entity](../resources/specifications/1.0.0-DRAFT.md#data-product-descriptor-entity). Within this object the field `infrastructuralComponents` contains the list of all [Infrastructural Component](../resources/specifications/1.0.0-DRAFT.md#infrastructure-component) of the data product.

![open-data-mesh descriptor components](../images/dpds-infrastructural-components.svg)

### Fields
An [Infrastructural Component](../resources/specifications/1.0.0-DRAFT.md#infrastructure-component) has the following two mandatory fields:

- `fullyQualifiedName` (string:fqn): This is the unique universal idetifier of the component. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:infrastructure:{infra-name}.`
- `version` (string:version): This is the <a href="https://semver.org/spec/v2.0.0.html" target="_blank">semantic version number</a> of the data product's infrastructural component. The  version of infrastructural components have no direct impact of the version of the data product they belong to. A change in the major version of an infrastructural component can anyway impact the version of one interface components and so indirectly the version of the data product.

Other non mandatory descriptive fields like `platform` and `infrastructureType` are also available. Moreover the [Infrastructural Component](../resources/specifications/1.0.0-DRAFT.md#infrastructure-component) can be extended with other fields  with **"x-" prefix** as needed.


### Example
The following example shows two infrastructural components that respectively describe 

1. The topology of kafka topics required to store
    - *technical events* generated by the `cdcIngestion` application while offloading data from the *TMS source*. 
    - *domain events* generated by `eventProcessor` application as composition of technical events that belong to the same *transaction* intercepted by `cdcIngestion` on the *TMS source*.
1. The schema and and tables required by `dbSinkConnector` application to materialize from streamed domain events the updated state of each *Trip*. 


```json
{
    "infrastructuralComponents": [
        {
            "fullyQualifiedName": "urn:dpds:com.company-xyz:dataproducts:tripExecution:1:infrastructure:eventStore",
            "version": "1.0.1",
            "description": "The kafka topics topology required to store technical events offloaded from TMS by the CDC and the domain events generetaed by eventProcessor application",
            "platform": "aws:eu-south-1:confluent",
            "infrastructureType":"storage-resource"
        }, {
            "fullyQualifiedName": "urn:dpds:com.company-xyz:dataproducts:tripExecution:1:infrastructure:stateStore",
            "version": "1.0.0",
            "description": "The database used by dbSinkConnector application to store the Trip updated state",
            "platform": "aws:eu-south-1:postgress",
            "infrastructureType":"storage-resource"
        }
    ]
}
```

The information provided so far are useful to track the infrastructural assets related to a specific data product. There are not anyway sufficient informtion to allow an external agent to provision the infrastructure autonomously. To this end in the [Infrastructural Component](../resources/specifications/1.0.0-DRAFT.md#infrastructure-component) there is the `provisioningService` filed that is described in much details in the next sections.

## Provisioning Service Object

The [Build Info Object](todo) contains the informations required to build an application component. DPDS uses *integration pipelines as code* to guarantee the possibility to automatize the build process in a riproducible way. Anyway to mantain technological indipendence the DPDS do not enforce the usage of any specific CICD tool.

### Fileds
A [Provisioning Info Object](todo) has the following three mandatory fields:

- `service` ( `string:name`  or [External Resource Object](#externalResourceObject)): This is the logical name or the actual endpoint of the service to call in order to build the infrastructural component. If the logical name (ex. `terraform`, `cloudformation`, `cdk`, ecc...) is used as field value the actual endpoint value resulution is demanded to the *data product experience plane* of the underlyng platform.
- `template` (`object` or [External Resource Object](#externalResourceObject)):  This is the definition as code of the infrastructure to provision. It is passed as is to the *provisioning service* implementation specified in the `service` field.
- `configurations` (`object` or [External Resource Object](#externalResourceObject)): This is the map of all configuration properties that must be used by the *provisioning service* at provisioning time. It is passed as is to the *provisioning service* implementation specified in the `service` field.

### Example
The following example shows an appliction that could be built using a terraform backed *provisioning service*. The *terraform file* that contains the description of the infrastructure is available on an external *bitbucket repository*. The only configuration parameter passed in to the *provision service* at runtime is the name of the schema to create on the the target postgress db.

```json
{
    "service": "terraform",
    "template": {
        "mediaType": "text/terraformfile",
        "$href": "https://bitbucket.org/company-xyz/trip-execution-infra-eventstore/src/master/main.tf"
    },
    "configurations": {
        "SCHEMA": "shipments",
    }
}
```
## Trip Execution Data Product Descriptor
The [Trip Execution Data Product](./example.md) is composed of two infrastructural components.

The file <a href="#">infra.json (coming soon) :fontawesome-brands-github:</a> contains the definition of these components.

You can read it on GitHub or cut and paste its content to <a href="https://jsoncrack.com/editor" target="_blank">JSON Crack :octicons-link-external-24:</a> for more interactive visualization.

## Summary
This page has shown that:

- a data product is composed not only of its public interface but also of internal components
- infrastructural components required by application components that implement services exposed by a data product through its ports are internal components described through an [Infrastructural Component](../resources/specifications/1.0.0-DRAFT.md#infrastructuralComponent).
- [Infrastructural Component](../resources/specifications/1.0.0-DRAFT.md#infrastructuralComponent) contains general information related to the specific infrastructure component but also all the required information to provision the onfrastructure in an automatic and reproducible way.
- the DPDS uses *infrastructure as code (IaC)*  to define how to provision infrastructure but does not enforce the use of any particular IaC tool, preserving in this way its [technology independence](../overview/README.md#principles).


[The next page](./components.md) describes how to reuse portions of a data product descriptor document to make it more readable and less redundant, reducing file size and maintenance cost.