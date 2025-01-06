# Data Product Descriptor Specification

#### Version 1.0.0 (DRAFT)
The keywords "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in <a href="https://tools.ietf.org/html/bcp14" target="_blank">BCP 14:octicons-link-external-24:</a> <a href="https://tools.ietf.org/html/rfc2119" target="_blank">RFC2119:octicons-link-external-24:</a> <a href="https://tools.ietf.org/html/rfc8174" target="_blank">RFC8174:octicons-link-external-24:</a> when, and only when, they appear in all capitals, as shown here.

This document is licensed under <a href="https://www.apache.org/licenses/LICENSE-2.0.html" target="_blank">The Apache License, Version 2.0:octicons-link-external-24:</a>.

#### Disclaimer

Part of this content has been taken from the great work done by the folks at the<a href="https://openapis.org" target="_blank">OpenAPI Initiative:octicons-link-external-24:</a> and <a href="https://www.asyncapi.com/" target="_blank">AsyncAPI Initiative:octicons-link-external-24:</a>. We have decided to not reinvent the wheel and inspire our work to these two specifications mainly for the following reasons:

- We think that the work made by OpenAPI Initiative and AsyncAPI Initiative is great :)
- We want to make the learning curve for the Data Product Descriptor Specification as smooth as possible, aligning its definition to the one of other two popular specifications in the software and data engineers community
- We think that OpenAPI and AsyncAPI are natural specifications for defining the interface of data product's ports that expose an API endpoint. This specification does not impose the use of any specific standard for the port's interface definition but these two are highly recommended.


## Introduction

The Data Product Descriptor Specification (DPDS) defines a declarative and technology-independent standard to describe a data product in all its components. It allows human agents (e.g. analysts, data scientists, etc..) and digital agents (e.g. other data products, BI tools, planes of the underlying data mesh ops platform, etc..) to operate, discover and access a data product. When properly defined, an external agent can understand and interact with the data product with a minimal amount of cognitive load and implementation logic.

The formalization of a standard data product descriptor document through an open specification is useful to enable the implementation of an ecosystem of interoperable data mesh tools. The following is a non-exhaustive list of tools that can benefit from the specification:

- catalogs (search, document and collaborate) 
- design tools (create new products by the composition of reusable templates)
- lifecycle management tools (deploy and operate) 
- access management tools (assign/track access grants and generate client code in different languages)
- policies checking tools (enforce standard compliance and audit security)
- observability tools (monitor and detect)
- data lineage tools (trace data flows and perform forward/backward analysis)
- mesh topology analysis tools (calculate value/trust scores and detect structural problems)
- semantic tools (apply ontologies over mesh topology)
- domain specific language tools (create a collection of interconnected data products that implement together a specific value stream)

## Table of Contents

<!-- TOC depthFrom:1 depthTo:3 withLinks:1 updateOnSave:1 orderedList:0 -->
- [Definitions](#definitions)
	- [Standard](#definitionsStandard)
	- [Standard Specification](#definitionsSpecification)
	- [Standard Definition](#definitionsDefinition)
	- [Data Product](#definitionsDataProduct)
	- [Data Product Ports](#definitionsDataProductPorts)
	- [Data Product Application Components](#definitionsDataProductAppComponents)
	- [Data Product Infrastructural Components](#definitionsDataProductInfraComponents)
	- [Data Product Descriptor Document](#definitionsDpdsDocument)
	- [Data Product Descriptor Specification](#definitionsDpdsSpecification)
- [Specification](#specification)
	- [Versions](#versions)
	- [Format](#format)
	- [Document Structure](#documentStructure)
	- [Data Types](#dataTypes)
	- [Rich Text Formatting](#richText)
	- [Relative References In URLs](#relativeReferences)
	- [Schema](#schema)
		- [Data Product Descriptor Entity](#dpdsObject)
		- [Info Object](#infoObject)
		- [Owner Object](#ownerObject)
		- [Contact Point Object](#contactPointObject)
		- [Interface Components Object](#interfaceComponentsObject)
        - [Input Port Component](#inputPortComponent)
		- [Output Port Component](#outputPortComponent)
        - [Discovery Port Component](#discoveryPortComponent)
        - [Observability Port Component](#observabilityPortComponent)
        - [Control Port Component](#controlPortComponent)
		- [Promises Object](#promisesObject)
        - [Expectations Object](#expectationsObject)
		- [Contracts Object](#contractsObject)
		- [Internal Components Object](#internalComponentsObject)
		- [Lifecycle Task Info Object](#lifecycleTaskInfoObject)
		- [Application Component](#applicationComponent)
		- [Infrastructural Component](#infrastructuralComponent)
		- [Components Object](#componentsObject)
		- [Reference Object](#reference-object)
		- [External Resource Object](#externalResourceObject)	
		- [Standard Definition Component](#standardDefinitionComponent)
	- [Specification Extension Point](#specificationExtensionPoint)
	- [Specification Extensions](#specificationExtensions)
- [Appendix A: Revision History](#revisionHistory)


<!-- /TOC -->

## <a name="definitions"></a>Definitions

##### <a name="definitionsStandard"></a>Standard
The set of shared rules used by different agents to describe an entity or process of common interest. The agents that follow the standard limit their autonomy by conforming to the set of shared rules to facilitate cooperation between them through interoperability.

##### <a name="definitionsSpecification"></a>Standard Specification
The formal description of the rules that form a [standard](#definitionsStandard). A standard can have multiple specification versions associated with it. Sometimes the words standard and specification are used as synonymous. 

##### <a name="definitionsDefinition"></a>Standard Definition
The description of one specific entity or process created using and conforming to the set of rules formally described in the [standard specification](#definitionsSpecification)

##### <a name="definitionsDataProduct"></a>Data Product
The smallest unit that can be independently deployed and managed in a data architecture (i.e. architectural quantum). It is composed of all the structural components that it requires to do its function: metadata, data, code, policies that govern the data and its dependencies to infrastructure. Each data product has a clear identifier, a version number and an owner.  

##### <a name="definitionsDataProductPorts"></a>Data Product Ports
The interfaces exposed to external agents by a [data product](#definitionsDataProduct). Each port exposes a service or set of correlated services. These are the five types of ports supported by a [data product](#definitionsDataProduct):

- **<a name="definitionsDataProductPortsInput"></a>Input port(s):** an input port describes a set of services exposed by a data product to collect its source data and makes it available for further internal transformation. An input port can receive data from one or more upstream sources in a push (i.e. asynchronous subscription) or pop mode (i.e. synchronous query). Each data product may have one or more input ports. 
- **<a name="definitionsDataProductPortsOutput"></a>Output port(s):** an output port describes a set of services exposed by a data product to share the generated data in a way that can be understood and trusted. Each data product may have one or more output ports. 
- **<a name="definitionsDataProductPortsDiscovery"></a>Discovery port(s):** a discovery port describes a set of services exposed by a data product to provide information about its static role in the overall architecture like purpose, structure, location, etc. Each data product may have one or multiple discovery ports. 
- **<a name="definitionsDataProductPortsObservability"></a>Observability port(s):** an observability port describes a set of services exposed by a data product to provide information about its dynamic behavior in the overall architecture like logs, traces, audit trails, metrics, etc. Each data product may have one or more observability ports. 
- **<a name="definitionsDataProductPortsControl"></a>Control port(s):** a control port describes a set of services exposed by a data product to configure local policies or perform highly privileged governance operations. Each data product may have one or more control ports. 

The [data product descriptor specification](definitionsDpdsSpecification) uses the following concepts of *promises theory* to formally describe the set of services exposed by each port regardless of the specific type:

- **<a name="definitionsDataProductPortsPromises"></a>Promises**:** Through promises, the data product declares the intent of the port. Promises are not a guarantee of the outcome but the data product will behave accordingly to them to realize its intent. The more a data product keeps its promises over time and the more trustworthy it is. Thus, the more trustworthy a data product is the more potential consumers are likely to use it. Trust is based on the verification of how good a data product was in the past in keeping its promises. This verification should be automated by the underlying platform and synthesized in a *trust score* shared with all potential consumers. Examples of promises are descriptions of services, API, SLO, deprecation policy, etc.
- **<a name="definitionsDataProductPortsExpectations"></a>Expectations**:** Through expectations, the data product declares how it wants the port to be used by its consumers. Expectations are the inverse of promises. They are a way to explicitly state what promises the data product would like consumers to make regarding how they will use the port. Examples of expectations are intended usage, intended audience, etc.
- **<a name="definitionsDataProductPortsContracts"></a>Contracts**:** Through contracts, the data product declares promises and expectations that must be respected by the data product and its consumers. A contract is an explicit agreement between the data product and its consumers. It is used to group all the promises and expectations that if not respected can generate penalties like monetary sanctions or interruption of service. Examples of contracts are terms of conditions, SLA, billing policy, etc.

The governance can use these concepts to standardize the definition of these interfaces across all data products, while the platform can use them to provide the mechanisms to implement the described services in a compliant way.


##### <a name="definitionsDataProductAppComponents"></a>Data Product Application Components
The components of a [data product](#definitionsDataProduct) that implement the services exposed through its [ports](#definitionsDataProductPorts) (i.e. pipelines, microservices, etc..). 

##### <a name="definitionsDataProductInfraComponents"></a>Data Product Infrastructural Components
The components of a [data product](#definitionsDataProduct) related to the infrastructural resources (i.e. storage, computing, etc..) used to run its [application components](definitionsDataProductAppComponents).

##### <a name="definitionsDpdsDocument"></a>Data Product Descriptor Document
The document (or set of documents) that contains the standard definition of a [data product](#definitionsDataProduct) created using and conforming to the [Data Product Descriptor Specification](definitionsDpdsSpecification).

##### <a name="definitionsDpdsSpecification"></a>Data Product Descriptor Specification
The formal description of the rules to follow to create a standard-compliant [Data Product Descriptor Document](definitionsDpdsDocument).


## <a name="specification"></a>Specification

### <a name="versions"></a> Versions

The Data Product Descriptor Specification is versioned using <a href="https://semver.org/spec/v2.0.0.html)" target="_blank">Semantic Versioning 2.0.0:octicons-link-external-24:</a> (semver) and follows the semver specification.

The `major`.`minor` portion of the semver (for example `1.0`) SHALL designate the DPDS feature set. Typically, *`.patch`* versions address errors in this document, not the feature set. Tooling which supports DPDS 1.0 SHOULD be compatible with all DPDS 1.0.\* versions. The patch version SHOULD NOT be considered by tooling, making any distinction between `1.0.0` and `1.0.1` for example.

Each new minor version of the Data Product Descriptor Specification SHALL allow any Product Descriptor document that is valid against any previous minor version of the Specification, within the same major version, to be updated to the new Specification version with equivalent semantics. Such an update MUST only require changing the `dataProductDescriptor` property to the new minor version.

For example, a valid Data Product Descriptor 1.0.2 document, upon changing its `dataProductDescriptor` property to `1.1.0`, SHALL be a valid Data Product Descriptor 1.1.0 document, semantically equivalent to the original Data Product Descriptor 1.0.2 document. New minor versions of the Data Product Descriptor Specification MUST be written to ensure this form of backward compatibility.


### <a name="format"></a> Format

A [Data Product Descriptor Document](#definitionsDpdsDocument) that conforms to the [Data Product Descriptor Specification](#definitionsDpdsSpecification) is itself a JSON object, which may be represented either in JSON or YAML format.

For example, if a field has an array value, the JSON array representation will be used:

```json
{
   "field": [ 1, 2, 3 ]
}
```
All field names in the specification are **case-sensitive**.
This includes all fields that are used as keys in a map, except where explicitly noted that keys are **case-insensitive**.

The schema exposes two types of fields: Fixed fields, which have a declared name, and Patterned fields, which declare a regex pattern for the field name.

Patterned fields MUST have unique names within the containing object. To preserve the ability to round-trip between YAML and JSON formats, YAML version <a href="https://yaml.org/spec/1.2/spec.html" target="_blank">1.2:octicons-link-external-24:</a> is RECOMMENDED along with some additional constraints:

- Tags MUST be limited to those allowed by the <a href="https://yaml.org/spec/1.2/spec.html#id2803231" target="_blank">JSON Schema ruleset:octicons-link-external-24:</a>.
- Keys used in YAML maps MUST be limited to a scalar string, as defined by the <a href="https://yaml.org/spec/1.2/spec.html#id2802346" target="_blank">YAML Failsafe schema ruleset:octicons-link-external-24:</a>.


### <a name="documentStructure"></a>Document Structure

A [Data Product Descriptor Document](#definitionsDpdsDocument) MAY be made up of a single document or be divided into multiple, connected parts at the discretion of the user. In the latter case, a [`Reference Object`](#reference-object) is used.

It is RECOMMENDED that the root [Data Product Descriptor Document](#definitionsDpdsDocument) be named: `data-product-descriptor.json` or `data-product-descriptor.yaml`.

### <a name="objectTypes"></a>Object Types

A [Data Product [Descriptor Document](#definitionsDpdsDocument) has one and only one root object. The properties of an object are described by its fields. A field type can be another object or a [primitive type](#dataTypeFormat). An addressable and versioned object is called entity. The root object of the [Data Product Descriptor Document](#definitionsDpdsDocument) is an entity object. Other entities that exist only in the scope of the root entity are called components. 

### <a name="dataTypes"></a>Data Types

Primitive data types in the DPDS are based on the types supported by the <a href="https://json-schema.org/draft/2020-12/json-schema-core.html#name-instance" target="_blank">JSON Schema Specification:octicons-link-external-24:</a>. 


<a name="dataTypeFormat"></a>Primitives have an optional modifier property: `format`.
DPDS uses several known formats to define in fine detail the data type being used.
However, to support documentation needs, the `format` property is an open `string`-valued property and can have any value.
Formats such as `"email"`, `"uuid"`, and so on, MAY be used even though undefined by this specification.
Types that are not accompanied by a `format` property follow the type definition in the JSON Schema. Tools that do not recognize a specific `format` MAY default back to the `type` alone as if the `format` is not specified.

The formats defined by the DPDS are:

[`type`](#dataTypes) | [`format`](#dataTypeFormat) | Comments
------ | -------- | --------
`integer` | `int32` | signed 32 bits
`integer` | `int64` | signed 64 bits (a.k.a long)
`number` | `float` | |
`number` | `double` | |
`string` | | |
`string` | `alphanumeric` | a string that match the following regex `^[a-zA-Z0-9]+$`
`string` | `name` | a string that match the following regex `^[a-zA-Z][a-zA-Z0-9]+$`
`string` | `fqn` | a string that match the following regex `^[a-zA-Z][a-zA-Z0-9.:]+$`
`string` | `version` | a string that match the following regex `^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$`
`string` | `byte` | base64 encoded characters
`string` | `binary` | any sequence of octets
`string` | `uuid` | a sequence of 16 octets as defined by <a href="https://www.rfc-editor.org/rfc/rfc4122.html" target="_blank">RFC4122:octicons-link-external-24:</a>
`boolean` | | |
`string` | `date` | As defined by `full-date` - <a href="https://www.rfc-editor.org/rfc/rfc3339" target="_blank">RFC3339:octicons-link-external-24:</a>
`string` | `date-time` | As defined by `date-time` - <a href="https://www.rfc-editor.org/rfc/rfc3339" target="_blank">RFC3339:octicons-link-external-24:</a>
`string` | `password` | A hint to UIs to obscure input.


### <a name="richText"></a>Rich Text Formatting
Throughout the specification `description` fields are noted as supporting CommonMark markdown formatting.
Where Data Product Descriptor tooling renders rich text it MUST support, at a minimum, markdown syntax as described by <a href="https://spec.commonmark.org/0.27/" target="_blank">CommonMark 0.27:octicons-link-external-24:</a>. Tooling MAY choose to ignore some CommonMark features to address security concerns. 

### <a name="relativeReferences"></a>Relative References in URLs

Unless specified otherwise, all properties that are URLs SHOULD be absolute references. If a property explicitly specifies in its description that allows a relative reference its value MUST be compliant with <a href="https://tools.ietf.org/html/rfc3986#section-4.2" target="_blank">RFC3986:octicons-link-external-24:</a>. Relative references MUST be resolved using the URLs defined in the property description as a Base URI.

Relative references used in `$ref` are processed as per <a href="https://tools.ietf.org/html/draft-pbryan-zyp-json-ref-03" target="_blank">JSON Reference:octicons-link-external-24:</a>, using the URL of the current document as the base URI. See also the [Reference Object](#reference-object).


### <a name="schema"></a>Schema

In the following description, if a field is not explicitly **REQUIRED** or described with a MUST or SHALL, it can be considered OPTIONAL.


#### <a name="dpdsObject"></a>Data Product Descriptor Entity

This is the root object of the [Data Product Descriptor Document](#definitionsDpdsDocument).


##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="dpdsSpecVersion"></a>dataProductDescriptor | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the [Data Product Descriptor Specification Version](#versions) that the [Data Product Descriptor Document](#definitionsDpdsDocument) uses. The [`dataProductDescriptor`](#dpdsSpecVersion) field SHOULD be used by tooling specifications and clients to interpret the [Data Product Descriptor Document](#definitionsDpdsDocument). This is *not* related to the data product's [`info.version`](#infoVersion) field.
<a name="dpdsInfoObject"></a>info | [Info Object](#infoObject) | **(REQUIRED)** The general information about the data product. The information can be used by the platform or by consumers if needed.
<a name="dpdsInterfaceComponents"></a>interfaceComponents | [Interface Components Object](#interfaceComponentsObject) | **(REQUIRED)** The list of all interface entities exposed by the data product.
<a name="dpdsInternalComponents"></a>internalComponents | [Internal Components Object](#internalComponentsObject) | The list of all internal entities that compose the data product.
<a name="dpdsComponents"></a>components | [Components Object](#componentsObject) | An element to hold a set of reusable objects that can be referentiated in other part of the document.
<a name="dpdsTags"></a>tags | [`string`] | A list of tags associated to the data product. Tags can be used for logical grouping of data products.
<a name="dpdsExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="infoObject"></a>Info Object

The `Info Object` contains general information about the data product. The information can be used by the platform or by consumers if needed.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="infoId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 ([RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the [`fullyQualifiedName`](#dpdsFullyQualifiedName). It MAY be used  when calling the API exposed by the data product experience plane to referentiate the data product. Because the [`fullyQualifiedName`](#dpdsFullyQualifiedName) is globally unique also the `id` is globally unique, anyway to referentiate the data product when calling an API different from the ones exposed by the data product experience plane the [`fullyQualifiedName`](#dpdsFullyQualifiedName) MUST be always used. Example: `"id: "2b172838-73b1-5d6c-be45-cc75aee180a0"`
<a name="infoFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)** The unique universal idetifier of the data product. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}`.  It's RECOMMENDED to use as `mesh-namespace` your company's domain name in reverse dot notation (es `it.quantyca`) in order to ensure that the `fullyQualifiedName` is unique universal idetifier as REQUIRED. To the `mesh-nemaspace` MAY be added as postfix the product's 'domain' (es. `planning`, `operations`, ...). Using the data product's `domain` as postfix in the `mesh-namespace` is anyway NOT RECOMMENDED. Example: `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1"`.
<a name="infoEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity. It MUST be a constant value equals to `dataproduct`.
<a name="infoName"></a>name | `string:name` | **(REQUIRED)** The name of the data product. MUST be unique within the `mesh-namespace`. It's RECOMMENDED to use a camel case formatted string.
<a name="infoVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product definition contained in the given [Data Product Descriptor Document](#definitionsDpdsDocument). Everytime the *major version* of one of the data product's ports changes also the *major version* of the product MUST be incremented. It is RECOMMENDED to use 0 as *major version* for data products that are not yet general available. These data products can introduce breaking changes without incrementing their *major version*. It is anyway RECOMMENDED that for every breaking change introduced by a data product that is not yet general available (i.e. *major version* equals to 0) at least the *minor version* is incremented. This field is *not* related to the [`dataProductDescriptor`](#dpdsSpecVersion) field.
<a name="infoDisplayName"></a>displayName | `string` | The human readable name of the data product. It SHOULD be used by frontend tool to visualize data product's name in place of the [`name`](#dpdsName) property. It's RECOMMENDED to not use the same `displayName` for different data products belonging to the same `mesh-namespace`.
<a name="infoDescription"></a>description | `string` | The data product description. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="infoDomain"></a>domain | `string:name` | **(REQUIRED)** The domain to which the data product belongs to.
<a name="infoOwner"></a>owner | [Owner Object](#ownerObject) | **(REQUIRED)** A collection of information related to the data product's owner.
<a name="infoContactPoints"></a>contactPoints | \[[Contact Point Object](#contactPointObject)\] | A collection of contact information for the given data product.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="ownerObject"></a>Owner Object

The `Owner Object` describes the data product's owner.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="infoOwnerId"></a>id| `string` | **(REQUIRED)** The identifier of the data product's owner. It's RECOMMENDED to use the corporate mail of the owner as identifier.
<a name="infoOwnerName"></a>name | `string` | The full name of the data product's owner

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Owner Object Example:

```json
{
  "id": "john.doe@company-xyz.com",
  "name": "John Doe"
}
``` 


#### <a name="contactPointObject"></a>Contact Point Object

The `Contact Point Object` describes a data product's contact point.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="contactPointName"></a>name| `string:name` | The name of the contact point.
<a name="contactPointDescription"></a>description | `string` | The contact point description. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="contactPointChannel"></a>channel| `string` | The channel used to address the contact point. It can be for example equal to  `web`, `mail` or `phone`.
<a name="contactPointAddress"></a>address| `string` | The address of the contact point. Depending on the channel it can be for example an URL, an email address or a phone number.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Contact Point Object Example:

```json
{
  "name": "Support Team Mail",
  "description": "The mail address of to the team that give support on this product",
  "channel": "email",
  "address": "trip-execution-support@company-xyz.com"
}
```  

```json
{
  "name": "Issue Tracker",
  "description": "The address of the issue tracker associated to this product",
  "channel": "web",
  "address": "https://readmine.company-xyz.com/trip-execution"
}
```

#### <a name="interfaceComponentsObject"></a>Interface Components Object

The `Interface Components Object` it's a collection of all interface entities exposed by a data product.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="interfaceComponentInputPorts"></a>inputPorts | \[[Input Port Component](#inputPortComponent)\| [Reference Object](#reference-object)\] | The [input ports](#definitionsDataProductPorts) exposed by the data product. 
<a name="interfaceComponentOutputPorts"></a>outputPorts | \[[Output Port Component](#outputPortComponent)\| [Reference Object](#reference-object)\] | **(REQUIRED)** The [output ports](#definitionsDataProductPorts) exposed by the data product. 
<a name="interfaceComponentDiscoveryPorts"></a>discoveryPorts | \[[Discovery Port Component](#discoveryPortComponent)\| [Reference Object](#reference-object)\] | The [discovery ports](#definitionsDataProductPorts) exposed by the data product.
<a name="interfaceComponentObservabilityPorts"></a>observabilityPorts | \[[Observability Port Component](#observabilityPortComponent) \| [Reference Object](#reference-object)\] | The [observability ports](#definitionsDataProductPorts) exposed by the data product.
<a name="interfaceComponentControlPorts"></a>controlPorts | \[[Control Port Component](#controlPortComponent)\| [Reference Object](#reference-object)\] | The [control ports](#definitionsDataProductPorts) exposed by the data product.

This object cannot be extended with additional properties and any properties added SHALL be ignored.

#### <a name="inputPortComponent"></a>Input Port Component

The `Input Port Component` describes an [input port](#definitionsDataProductPorts) of a data product.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="inputPortId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 (see [RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the port's `fullyQualifiedName`. It MAY be used  when calling the API exposed by the `data product experience plane` to referentiate the port. Because the `fullyQualifiedName` is globally unique also the `id` is globally unique, anyway to referentiate the data product when calling API different from the ones exposed by the `data product experience plane` the port's `fullyQualifiedName` MUST be always used. Example: `"id": "3235744b-8d2e-57b5-afba-f66862cc6a21"`
<a name="inputPortFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)**. The unique universal idetifier of the port. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:inputports:{port-name}`. Example:  `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1:inputports:tmsTripCDC"`.
<a name="inputPortEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity. It MUST be a constant value equals to `inputport`.
<a name="inputPortName"></a>name | `string:name` | **(REQUIRED)** The name of the port. It MUST be unique within the other input ports of the same data product. It's RECOMMENDED to use a cammel case formatted string. Example `"name: "tmsTripCDC"`.
<a name="inputPortVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product's port. Everytime the *major version* of port changes also the *major version* of the product MUST be incremented.
<a name="inputPortDisplayName"></a>displayName | `string` | The human readable name of the port. It SHOULD be used by frontend tool to visualize port's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different input ports belonging to the same data product.
<a name="inputPortDescription"></a>description | `string` | The port descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="inputPortComponentGroup"></a>componentGroup | `string:name` | The name of the group this component belongs to. Grouping different components together is useful to define sub modules withing a data product. A sub module can be used as base for creating reusable templates. 
<a name="inputPortPromises"></a>promises | [Promises Object](#PromisesObject) \| [Reference Object](#reference-object) | The data product's [promises](#definitionsDataProductPortsPromises) declared over the port.
<a name="inputPortExpectations"></a>expectations | [Expectation Object](#expectationsObject) \| [Reference Object](#reference-object) | The data product's [expectations](#definitionsDataProductPortsExpectations) declared over the port.
<a name="inputPortContracts"></a>contracts | [Contracts Object](#contractsObject) \| [Reference Object](#reference-object) | The data product's [contracts](#definitionsDataProductPortsContracts) declared over the port.
<a name="inputPortTags"></a>tags | [`string`] | A list of tags associated to the component. Tags can be used for logical grouping of data product's components.
<a name="inputPortExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="outputPortComponent"></a>Output Port Component

The `Output Port Component` describes an [output port](#definitionsDataProductPorts) of a data product.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="outputPortId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 (see [RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the port's `fullyQualifiedName`. It MAY be used  when calling the API exposed by the `data product experience plane` to referentiate the port. Because the `fullyQualifiedName` is globally unique also the `id` is globally unique, anyway to referentiate the data product when calling API different from the ones exposed by the `data product experience plane` the port's `fullyQualifiedName` MUST be always used. Example: `"id": "3235744b-8d2e-57b5-afba-f66862cc6a21"`
<a name="outputPortFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)** The unique universal idetifier of the port. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:outputports:{port-name}`. Example `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1:outputports:tmsTripCDC"`.
<a name="outputPortEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity. It MUST be a constant value equals to `outputport`. 
<a name="outputPortName"></a>name | `string:name` | **(REQUIRED)** The name of the port. MUST be unique within the other input ports of the same data product. It's RECOMMENDED to use a cammel case formatted string. Example `"name: "tmsTripCDC"`.
<a name="outputPortVersion"></a>version | `string:version` |  **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product's port. Everytime the *major version* of port changes also the *major version* of the product MUST be incremented.
<a name="outputPortDisplayName"></a>displayName | `string` | The human readable name of the port. It SHOULD be used by frontend tool to visualize port's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different input ports belonging to the same data product.
<a name="outputPortDescription"></a>description | `string` | The port descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="outputPortComponentGroup"></a>componentGroup | `string:name` | The name of the group this component belongs to. Grouping different components together is useful to define sub modules withing a data product. A sub module can be used as base for creating reusable templates. 
<a name="outputPortPromises"></a>promises | [Promises Object](#PromisesObject) \| [Reference Object](#reference-object) | The data product's [promises](#definitionsDataProductPortsPromises) declared over the port.
<a name="outputPortExpectations"></a>expectations | [Expectation Object](#expectationsObject) \| [Reference Object](#reference-object) | The data product's [expectations](#definitionsDataProductPortsExpectations) declared over the port.
<a name="outputPortContracts"></a>contracts | [Contracts Object](#contractsObject) \| [Reference Object](#reference-object) | The data product's [contracts](#definitionsDataProductPortsContracts) declared over the port.
<a name="outputPortTags"></a>tags | [`string`] | A list of tags associated to the component. Tags can be used for logical grouping of data product's components.
<a name="outputPortExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="discoveryPortComponent"></a>Discovey Port Component

The `Discovey Port Component` describes a [discovery port](#definitionsDataProductPorts) of a data product.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="discoveryPortId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 (see [RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the port's `fullyQualifiedName`. It MAY be used  when calling the API exposed by the data product experience plane to referentiate the port. Because the `fullyQualifiedName` is globally unique also the `id` is globally unique, anyway to referentiate the data product when calling API different from the ones exposed by the data product experience plane the port's `fullyQualified` name MUST be always used. `"id: "3235744b-8d2e-57b5-afba-f66862cc6a21"`
<a name="discoveryPortFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)**. The unique universal idetifier of the port. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:inputports:{port-name}`. Example `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1:inputports:tmsTripCDC"`.
<a name="discoveryPortEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity. It MUST be a constant value equals to `discoveryport`.
<a name="discoveryPortName"></a>name | `string:name` | **(REQUIRED)** The name of the port. MUST be unique within the other input ports of the same data product. It's RECOMMENDED to use a cammel case formatted string. Example `"name: "tmsTripCDC"`.
<a name="discoveryPortVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product's port. Everytime the *major version* of port changes also the *major version* of the product MUST be incremented.
<a name="discoveryPortDisplayName"></a>displayName | `string` | The human readable name of the port. It SHOULD be used by frontend tool to visualize port's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different input ports belonging to the same data product.
<a name="discoveryPortDescription"></a>description | `string` | The port descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="discoveryPortComponentGroup"></a>componentGroup | `string:name` | The name of the group this component belongs to. Grouping different components together is useful to define sub modules withing a data product. A sub module can be used as base for creating reusable templates. 
<a name="discoveryPortPromises"></a>promises | [Promises Object](#PromisesObject) \| [Reference Object](#reference-object) | The data product's [promises](#definitionsDataProductPortsPromises) declared over the port.
<a name="discoveryPortExpectations"></a>expectations | [Expectation Object](#expectationsObject) \| [Reference Object](#reference-object) | The data product's [expectations](#definitionsDataProductPortsExpectations) declared over the port.
<a name="discoveryPortContracts"></a>contracts | [Contracts Object](#contractsObject) \| [Reference Object](#reference-object) | The data product's [contracts](#definitionsDataProductPortsContracts) declared over the port.
<a name="discoveryPortTags"></a>tags | [`string`] | A list of tags associated to the component. Tags can be used for logical grouping of data product's components.
<a name="discoveryPortExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="observabilityPortComponent"></a>Observability Port Component

The `Observability Port Component` describes an [observability port](#definitionsDataProductPorts) of a data product.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="observabilityPortId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 (see [RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the port's `fullyQualifiedName`. It MAY be used  when calling the API exposed by the data product experience plane to referentiate the port. Because the `fullyQualifiedName` is globally unique also the `id` is globally unique, anyway to referentiate the data product when calling API different from the ones exposed by the data product experience plane the port's `fullyQualified` name MUST be always used. `"id: "3235744b-8d2e-57b5-afba-f66862cc6a21"`
<a name="observabilityPortFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)** The unique universal idetifier of the port. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:inputports:{port-name}`. Example `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1:inputports:tmsTripCDC"`.
<a name="observabilityPortEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity. It MUST be a constant value equals to `observabilityport`.
<a name="observabilityPortName"></a>name | `string:name` | **(REQUIRED)** The name of the port. MUST be unique within the other input ports of the same data product. It's RECOMMENDED to use a cammel case formatted string. Example `"name: "tmsTripCDC"`.
<a name="observabilityPortVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product's port. Everytime the *major version* of port changes also the *major version* of the product MUST be incremented.
<a name="observabilityPortDisplayName"></a>displayName | `string` | The human readable name of the port. It SHOULD be used by frontend tool to visualize port's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different input ports belonging to the same data product.
<a name="observabilityPortDescription"></a>description | `string` | The port descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="observabilityPortComponentGroup"></a>componentGroup | `string:name` | The name of the group this component belongs to. Grouping different components together is useful to define sub modules withing a data product. A sub module can be used as base for creating reusable templates. 
<a name="observabilityPortPromises"></a>promises | [Promises Object](#PromisesObject) \| [Reference Object](#reference-object) | The data product's [promises](#definitionsDataProductPortsPromises) declared over the port.
<a name="observabilityPortExpectations"></a>expectations | [Expectation Object](#expectationsObject) \| [Reference Object](#reference-object) | The data product's [expectations](#definitionsDataProductPortsExpectations) declared over the port.
<a name="observabilityPortContracts"></a>contracts | [Contracts Object](#contractsObject) \| [Reference Object](#reference-object) | The data product's [contracts](#definitionsDataProductPortsContracts) declared over the port.
<a name="observabilityPortTags"></a>tags | [`string`] | A list of tags associated to the component. Tags can be used for logical grouping of data product's components.
<a name="observabilityPortExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="controlPortComponent"></a>Control Port Component

The `Control Port Component` describes a [control port](#definitionsDataProductPorts) of a data product.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="controlPortId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 (see [RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the port's `fullyQualifiedName`. It MAY be used  when calling the API exposed by the data product experience plane to referentiate the port. Because the `fullyQualifiedName` is globally unique also the `id` is globally unique, anyway to referentiate the data product when calling API different from the ones exposed by the data product experience plane the port's `fullyQualified` name MUST be always used. `"id: "3235744b-8d2e-57b5-afba-f66862cc6a21"`
<a name="controlPortFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)**. The unique universal idetifier of the port. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:inputports:{port-name}`. Example `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1:inputports:tmsTripCDC"`.
<a name="controlPortEntityType"></a>entityType | `string:alphanumeric` | The type of the entity. It MUST be a constant value equals to `controlport`.
<a name="controlPortName"></a>name | `string:name` | **(REQUIRED)** The name of the port. MUST be unique within the other input ports of the same data product. It's RECOMMENDED to use a cammel case formatted string. Example `"name: "tmsTripCDC"`.
<a name="controlPortVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product's port. Everytime the *major version* of port changes also the *major version* of the product MUST be incremented.
<a name="controlPortDisplayName"></a>displayName | `string` | The human readable name of the port. It SHOULD be used by frontend tool to visualize port's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different input ports belonging to the same data product.
<a name="controlPortDescription"></a>description | `string` | The port descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="controlPortComponentGroup"></a>componentGroup | `string:name` | The name of the group this component belongs to. Grouping different components together is useful to define sub modules withing a data product. A sub module can be used as base for creating reusable templates. 
<a name="controlPortPromises"></a>promises | [Promises Object](#PromisesObject) \| [Reference Object](#reference-object) | The data product's [promises](#definitionsDataProductPortsPromises) declared over the port.
<a name="controlPortExpectations"></a>expectations | [Expectation Object](#expectationsObject) \| [Reference Object](#reference-object) | The data product's [expectations](#definitionsDataProductPortsExpectations) declared over the port.
<a name="controlPortContracts"></a>contracts | [Contracts Object](#contractsObject) \| [Reference Object](#reference-object) | The data product's [contracts](#definitionsDataProductPortsContracts) declared over the port.
<a name="controlPortTags"></a>tags | [`string`] | A list of tags associated to the component. Tags can be used for logical grouping of data product's components.
<a name="controlPortExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="PromisesObject"></a>Promises Object

The `Promises Object` describes the data product's [promises](#definitionsDataProductPortsPromises) declared over a given port.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="promisesPlatform"></a>platform | `string` | The target technological platform in which the services associated with the given port operate. It contains usually the infrastructure provider and data center location. Optionally it can contains also the specific runtime technology used. Examples: `onprem:milan-1`, `aws:eu-south-1`, `aws:eu-south-1:redshift`.
<a name="promisesServicesType"></a>servicesType | `string` | The type of services associated with the given port. Examples: `soap-services`, `rest-services`, `odata-services`,`streaming-services`, `datastore-services`.
<a name="promisesApi"></a>api | [Standard Definition Object](#standardDefinitionComponent) | The formal description of port's services API. It is RECOMMENDED to use [Open API Specification](https://github.com/OAI/OpenAPI-Specification) for restfull services, [Async API Specification](https://github.com/asyncapi/spec) for streaming services and [DataStore API Specification](https://github.com/opendatamesh-initiative/odm-specification-datastoreapi/blob/main/versions/1.0.0-DRAFT.md) for data store connection based services. Other specifications MAY be used as required.
<a name="promisesDeprecationPolicy"></a>depreceationPolicy | [Standard Definition Object](#standardDefinitionComponent) | The deprecation policy adopted by the port. It is RECOMMENDED to specify at least how long the deprecation period will be after the release of a new major version.
<a name="promisesSlo"></a>slo | [Standard Definition Object](#standardDefinitionComponent) | The service level objectives supported by the port. It is RECOMMENDED to group SLO by category (ex. operational SLO, quality SLO, etc ...) and specify them in an easy to compute way.


This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="expectationsObject"></a>Expectations Object

The `Expectations Object` describes the data product's [expectations](#definitionsDataProductPortsExpectations) declared over a given port.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="expectationsIntendedAudience"></a>audience | [Standard Definition Object](#standardDefinitionComponent) | The audience of consumers for whom the the port has been designed. It is RECOMMENDED to specify inclusion and exclusion criteria in a way that is not ambiguous.
<a name="expectationsIntendedUsage"></a>usage | [Standard Definition Object](#standardDefinitionComponent) | The usage patterns for which the port has been designed.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

#### <a name="contractsObject"></a>Obligations Object
The Obligations` Object` describes the data product's [obligations](#definitionsDataProductPortsObligations) declared over a given port.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="contractsTermsAndConditions"></a>termsAndConditions | [Standard Definition Object](#standardDefinitionComponent) | The terms and conditions defined on the port on which consumers must agree on and respect in order to use it.
<a name="contractsBillingPolicy"></a>billingPolicy | [Standard Definition Object](#standardDefinitionComponent) | The billing policy defined on the port on which consumers must agree on and respect in order to use it.
<a name="contractsSla"></a>sla | [Standard Definition Object](#standardDefinitionComponent) | The service level agreements supported by the port. It is RECOMMENDED to group SLA by category (ex. operational SLA, quality SLA, ecc ...) and specify them in an easy to compute way.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="internalComponentsObject"></a>Internal Components Object

The `Internal Components Object` it's a collection of all internal entities that compose a data product.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="lifecycleInfo"></a> lifecycleInfo | Map\[`string`, \[[Lifecycle Task Info Object](#lifecycleTaskInfoObject)\]\]  | A list of lifecycle stages and associated tasks. Each stage can contais multiple tasks. To move a product to a specific stage the platform MUST execute all the tasks associated to the target stage in order of definition, if a different order is not specified using the `order` property of [Lifecycle Task Info Object](#lifecycleTaskInfoObject).
<a name="internalApplicationComponents"></a>applicationComponents | \[[Application Component](#applicationComponent)\] | The list of application component that compose the data product.
<a name="internalInfrastructuralComponents"></a>infrastructuralComponents | \[[Infrastructural Component](#infrastructuralComponent)\] | The list of infrastructural components that compose the data product.

This object cannot be extended with additional properties and any properties added SHALL be ignored.



#### <a name="lifecycleTaskInfoObject"></a>Lifecycle Task Info Object

The `Lifecycle Task Info Object` describe a task to execute to move the product to a specific stage in its lifecycle. Each stage can contains multipe tasks.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="taskInfoName"></a>name | `string:name` | The name of the task
<a name="taskInfoName"></a>order | `integer:int32` | The execution order of the task. The platform MUST execute first the tasks with this field valorized properly ordered in ascendent way using the value of the field itself and only then all the other tasks in order of definition.
<a name="taskInfoService"></a>service | [Reference Object](#reference-object) | The endpoint of the service to call in order to *execute* the task. 
<a name="taskInfoTemplate"></a>template |   [Standard Definition Object](#standardDefinitionComponent)  \| [Reference Object](#reference-object) | Can be an inline JSON or a refernce to an external resource. It contains the definition of the task to execute. It is passed as is to the executor service specified using the `service` field.
<a name="taskInfoConfigurations"></a>configurations | `object` \| [Reference Object](#reference-object) | Can be an inline JSON or a refernce to an external resource. It contains the configuration properties that can be used by the executor service at execution time. It is passed as is to the executor service specified using the `service` field.


This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Lifecycle Task Info Object Example:

```json
	"lifecycleInfo": {
      "test": [{
        "service": {
          "$href": "{azure-devops}"
        },
        "template": {
          "name": "testPipeline",
          "version": "1.0.0",
          "specification": "azure-devops",
          "specificationVersion": "1.0.0",
          "definition": {
            "organization": "andreagioia",
            "project": "opendatamesh",
            "pipelineId": "3",
            "branch": "main"
          }
        },
        "configurations": {
          "stagesToSkip": ["Deploy"]
        }
      }],
      "prod": [{
        "service": {
          "$href": "{azure-devops}"
        },
        "template": {
          "name": "testPipeline",
          "version": "1.0.0",
          "specification": "azure-devops",
          "specificationVersion": "1.0.0",
          "definition": {
            "organization": "andreagioia",
            "project": "opendatamesh",
            "pipelineId": "3",
            "branch": "main"
          }
        },
        "configurations": {
          "stagesToSkip": []
        }
      }],
      "deprecated": [{ }]
    }
``` 

#### <a name="applicationComponent"></a>Application Component

The `Application Component` describes an internal application component used by the data product to provide services through its ports.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="appId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 (see [RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the component's `fullyQualifiedName`. It MAY be used  when calling the API exposed by the *data product experience plane* to address the component. Because the `fullyQualifiedName` is globally unique also the `id` is globally unique, anyway to address the component when calling API different from the ones exposed by the *data product experience plane* the component's `fullyQualifiedName` MUST be always used. Examples: `"id: "3235744b-8d2e-57b5-afba-f66862cc6a21"`
<a name="appFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)**. The unique universal idetifier of the component. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:applications:{app-name}`. Example `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1:applications:modelNormalizationJob"`.
<a name="appEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity. It is a constant value equals to `application`.
<a name="appName"></a>name | `string:name` | **(REQUIRED)** The name of the application component. MUST be unique within the other application components of the same data product. It's RECOMMENDED to use a camel case formatted string. Example `"name: "modelNormalizationJob"`.
<a name="appVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product's application component. 
<a name="appDisplayName"></a>displayName | `string` | The human readable name of the component. It SHOULD be used by frontend tool to visualize application component's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different application component belonging to the same data product.
<a name="appDescription"></a>description | `string` | The application component description. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="appPlatform"></a>platform | `string` | The target technological platform on which the application will be deployed. It contains usually the infrastructure provider and data center location. Optionally it can contains also the specific runtime technology used. Examples: `onprem:milan-1`, `aws:eu-south-1`, `aws:eu-south-1:redshift`.
<a name="appType"></a>applicationType | `string` | The type of the application: Examples: `stream-sourcing`, `batch-sourcing`, `streaming-transformation`, `batch-transformation`, `housekeeping`, ecc...
<a name="appConsumesFrom"></a>consumesFrom | [`string:fqn`] | The list of ports or infrastructural components from which the application consumes *directly* data or services.
<a name="appProvidesTo"></a>providesTo | [`string:fqn`] | The list of ports or infrastructural components to which the application provides *directly* data or services.
<a name="appDependsOn"></a>dependsOn | [`string:fqn`] | A list of other internal components on which this application directly depends on. It is used during data product deployment to define a consistent deployment plan. Cyclic dependencies between components MUST be avoided.
<a name="appComponentGroup"></a>componentGroup | `string:name` | The name of the group this component belongs to. Grouping different components together is useful to define sub modules withing a data product. A sub module can be used as base for creating reusable templates. 
<a name="appComponentTags"></a>tags | [`string`] | A list of tags associated to the component. Tags can be used for logical grouping of data product's components.
<a name="appComponentExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.


This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="infrastructuralComponent"></a>Infrastructural Component

The `Infrastructural Component` describes an internal infrastructural component used by the data product to run its applications and store its data.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="infraId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 (see [RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the component's `fullyQualifiedName`. It MAY be used  when calling the API exposed by the *data product experience plane* to address the component. Because the `fullyQualifiedName` is globally unique also the `id` is globally unique, anyway to address the component when calling API different from the ones exposed by the *data product experience plane* the component's `fullyQualifiedName` MUST be always used. Examples: `"id: "3235744b-8d2e-57b5-afba-f66862cc6a21"`
<a name="infraFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)**. The unique universal idetifier of the component. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}:infrastructure:{infra-name}`. Example `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1:infrastructure:stagingArea"`.
<a name="infraEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity. It is a constant value equals to `infrastructure`.
<a name="infraName"></a>name | `string:name` | The name of the infrastructural component. MUST be unique within the other infrastructural components of the same data product. It's RECOMMENDED to use a camel case formatted string. Example `"name: "stagingArea"`.
<a name="infraVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product's infrastructural component. 
<a name="infraDisplayName"></a>displayName | `string` | The human readable name of the component. It SHOULD be used by frontend tool to visualize application component's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different infrastructural component belonging to the same data product.
<a name="infraDescription"></a>description | `string` | The infrastructural component descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="infraPlatform"></a>platform | `string` |  The target technological platform on which the infrastructural component will be provisioned. It contains usually the infrastructure provider and data center location. Optionally it can contains also the specific resource object that will be provisioned. Examples: `onprem:milan-1`, `aws:eu-south-1`, `aws:eu-south-1:s3-buket`.
<a name="infraInfrastructureType"></a>infrastructureType | `string` |  The type of the infrastructural component. Examples: `computation-resource`, `storage-resource`, `networking-resource`, ecc... 
<a name="infraDependsOn"></a>dependsOn | [`string:fqn`] | A list of other infrastructural components on which this component directly depends on. It is used during infrastructure provisioning to define a consistent provisioning plan. Cyclic dependencies between infrastructural components MUST be avoided.
<a name="infraComponentGroup"></a>componentGroup | `string:name` | The name of the group this component belongs to. Grouping different components together is useful to define sub modules withing a data product. A sub module can be used as base for creating reusable templates. 
<a name="infraComponentTags"></a>tags | [`string`] | A list of tags associated to the component. Tags can be used for logical grouping of data product's components.
<a name="infraComponentExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

#### <a name="standardDefinitionComponent"></a>Standard Definition Component

The `Standard Definition Component` formally describes a component (ex. API component, template component, etc ...) of interest following a given standard specification.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="standardDefinitionId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 (see [RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the port's `fullyQualifiedName`. It MAY be used  when calling the API exposed by the `data product experience plane` to referentiate the component. Because the `fullyQualifiedName` is globally unique also the `id` is globally unique, anyway to referentiate the data product when calling API different from the ones exposed by the `data product experience plane` the component's `fullyQualifiedName` MUST be always used. Example: `"id": "3235744b-8d2e-57b5-afba-f66862cc6a21"`
<a name="standardDefinitionFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)**. The unique universal idetifier of the component. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:{entity-type}s:{name}:{version}`. Example:  `"fullyQualifiedName: "urn:dpds:it.quantyca:apis:customApi:1"`.
<a name="standardDefinitionEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity (ex. api, template, ecc...)
<a name="standardDefinitionName"></a>name | `string:name` | **(REQUIRED)** The name of the component. It MUST be unique within the component of the same type. It's RECOMMENDED to use a cammel case formatted string. Example `"name: "tmsTripCDC"`.
<a name="standardDefinitionVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the component. 
<a name="standardDefinitionDisplayName"></a>displayName | `string` | The human readable name of the component. It SHOULD be used by frontend tool to visualize component's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different components of the same type.
<a name="standardDefinitionDescription"></a>description | `string` | The object descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="standardDefinitionSpecification"></a>specification | `string` | **(REQUIRED)** The external specification used in the `definition`.
<a name="standardDefinitionSpecificationVersion"></a>specificationVersion | `string` | The version of the external specification used in the `definition`. If not defined the version MUST be included in the definition itself.
<a name="standardDefinitionDefinition"></a>definition | `object` \| `string` \| [Reference Object](#reference-object) | **(REQUIRED)** The formal definition built using the spcification declared in the `specification` field.
<a name="standardDefinitionGroup"></a>componentGroup | `string:name` | The name of the group this component belongs to. Grouping different components together is useful to define sub modules withing a data product. A sub module can be used as base for creating reusable templates. 
<a name="standardDefinitionTags"></a>tags | [`string`] | A list of tags associated to the component. Tags can be used for logical grouping of data product's components.
<a name="standardDefinitionExternalDocs"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation for the component.

This object MAY be extended with [Specification Extensions](#specificationExtensions).  

##### Standard Definition Component Example:
traduci: qualcosa di simile al modello distribuito descritto nel post quindi? come vengono gestite le divergenze a livello semantico che generalmente ci sono tra i diversi domini? Quando i concetti sono gli stessi e cambia solo la terminologia allora basta aver la possibilità di indicare
```json
{
  "description": "The API exposed by the Observability Port that exposes data product logs",
  "specification": "openapi",
  "version": "3.1.0",
  "definition": {
	"mediaType": "text/json",
	"$href": "https://mycompany.com/api/v1/planes/utility/logging-services/openapi.json"
  },
  "externalDocs": {
	"mediaType": "text/html",
	"$href": "https://spec.openapis.org/oas/v3.1.0"
  }
}
``` 

#### <a name="componentsObject"></a>Components Object

The `Components Object` holds a set of reusable objects for different aspects of the DPDS.
All objects defined within the components object will have no effect on the Data Product Descriptor unless they are explicitly referenced from properties outside the components object.

##### Fixed Fields

Field Name | Type | Description
---|:---|---
<a name="componentsInputPorts"></a> inputPorts | Map[`string`, [Input Port Component](#inputPortComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Input Port Component](#inputPortComponent).
<a name="componentsOutputPorts"></a> outputPorts | Map[`string`, [Output Port Component](#outputPortComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Output Port Component](#outputPortComponent).
<a name="componentsDiscoveryPorts"></a> discoveryPorts | Map[`string`, [Discovery Port Component](#discoveryPortComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Discovery Port Component](#discoveryPortComponent).
<a name="componentsObservabilityPorts"></a> observabilityPorts | Map[`string`, [Observability Port Component](#observabilityPortComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Observability Port Component](#observabilityPortComponent).
<a name="componentsControlPorts"></a> controlPorts | Map[`string`, [Control Port Component](#ControlPortComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Control Port Component](#ControlPortComponent).
<a name="componentsApplicationComponent"></a> applicationComponents | Map[`string`, [Application Component](#applicationComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Application Component](#applicationComponent).
<a name="componentsInfrastructuralComponent"></a> infrastructuralComponents | Map[`string`, [Infrastructural Component](#infrastructuralComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Infrastructural Component](#infrastructuralComponent).
<a name="apiStandardDefinitionComponent"></a> apis | Map[`string`, [Standard Definition Object](#standardDefinitionComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Standard Definition Object](#standardDefinitionComponent) of API.
<a name="templateStandardDefinitionComponent"></a> templates | Map[`string`, [Standard Definition Object](#standardDefinitionComponent) \| [Reference Object](#reference-object)] | An object to hold reusable [Standard Definition Object](#standardDefinitionComponent) of templates.


This object MAY be extended with [Specification Extensions](#specificationExtensions).

All the fixed fields declared above are objects that MUST use keys that match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.

#### <a name="referenceObject"></a>Reference Object

The `Reference Object` allows referencing other components in the [Data Product Descriptor Document](#definitionsDpdsDocument), internally and externally.

The `$ref` string value contains a URI [RFC3986](https://tools.ietf.org/html/rfc3986), which identifies the location of the value being referenced.

See the rules for resolving [Relative References](#relativeReferencesURI).

##### Fixed Fields
Field Name | Type | Description
---|:---:|---
<a name="referenceDescription"></a>description | `string` | A description which by default SHOULD override that of the referenced component. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation. If the referenced object-type does not allow a `description` field, then this field has no effect.
<a name="referenceMediaType"></a>mediaType | `string` | The media type of the referenced resource. It must conform to media type format, according to [RFC6838](https://www.rfc-editor.org/rfc/rfc6838).
<a name="referenceRef"></a>$ref | `string:uri-reference` | **REQUIRED**. The reference identifier. This MUST be in the form of a URI.

This object cannot be extended with additional properties and any properties added SHALL be ignored.

##### Reference Object Example

```json
{
  "$ref": "#/components/schemas/Pet"
}
```

##### Relative Schema Document Example
```json
{
  "$ref": "Pet.json"
}
```

##### Relative Documents With Embedded Schema Example
```json
{
  "$ref": "definitions.json#/Pet"
}
```

#### <a name="externalResourceObject"></a>External Resource Object

The `External Resource Object` allows referencing an external resource like a documentation page.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="externalResourceDescription"></a>description | `string` | A description of the target resource. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation. 
<a name="externalResourceMediaType"></a>mediaType | `string` | The media type of target resource. It must conform to media type format, according to [RFC6838](https://www.rfc-editor.org/rfc/rfc6838).
<a name="externalResourceHref"></a>$href | `string:uri` | **REQUIRED**. The URI of the target resource. It must conform to the URI format, according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986).

This object cannot be extended with additional properties and any properties added SHALL be ignored.

##### External Resource Object Example

```json
{
  "description": "Find more info here",
  "mediaType": "text/html",
  "$href": "https://example.com"
}
```

### <a name="specificationExtensionPoint"></a>Specification Extension Point
A `Specification Extension Point` marks specific parts of the [Data Product Descriptor Specification](#definitionsDpdsSpecification) that are left open to extensions or further evolution of the standard. While a [Standard Definition](#definitionsDefinition) it's a formal declaration that the description of a part of the [Data Product Descriptor Specification](#definitionsDpdsSpecification) will be demanded by an external standard in this version of the specification and future ones, the same assumption it's not true for `Specification Extension Points`. Even if a `Specification Extension Point` can be extended at will it is RECOMMENDED to use for all added properties a field name prefixed by *"x-"* to avoid potential conflicts with future versions of the [Data Product Descriptor Specification](#definitionsDpdsSpecification).

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="specificationExtensionPointDescription"></a>description | string | The extention point descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="specificationExtensionPointExternalDocs"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation for the extention point

This object MAY be extended with [Specification Extensions](#specificationExtensions).


### <a name="specificationExtensions"></a>Specification Extensions

While the [Data Product Descriptor Specification](#definitionsDpdsSpecification) tries to accommodate most use cases, additional data can be added to extend the specification at certain points.
The extension properties are implemented as patterned fields that are always prefixed by `"x-"`.

Field Pattern | Type | Description
---|:---:|---
<a name="infoExtensions"></a>^x- | Any | Allows extensions to the Data Product Descriptor Schema. The field name MUST begin with `x-`, for example, `x-internal-id`. The value can be `null`, a primitive, an array or an object. Can have any valid JSON format value.

The extensions may or may not be supported by the available tooling, but those may be extended as well to add requested support (if tools are internal or open-sourced).

## <a name="revisionHistory"></a>Appendix A: Revision History

Version   | Date       | Notes
---       | ---        | ---
1.0.0     | 2023-Q1	   | Release of the Data Product Descriptor Specification 1.0.0 