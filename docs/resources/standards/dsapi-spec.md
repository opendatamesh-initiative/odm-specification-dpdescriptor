# Data Store API Specification

#### Version 1.0.0-DRAFT
The keywords "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [BCP 14](https://tools.ietf.org/html/bcp14) [RFC2119](https://tools.ietf.org/html/rfc2119) [RFC8174](https://tools.ietf.org/html/rfc8174) when, and only when, they appear in all capitals, as shown here.

This document is licensed under [The Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).

#### Disclaimer

Part of this content has been taken from the great work done by the folks at the [OpenAPI Initiative](https://openapis.org) and [AsyncAPI Initiative](https://www.asyncapi.com/). We have decided to not reinvent the wheel and inspire our work to these two specifications mainly for the following reasons:

- We think that the work made by OpenAPI Initiative and AsyncAPI Initiative is great  :)
- We want to make the learning curve for the Data Store API Specification as smooth as possible, aligning its definition to the one of other two popular specifications in the software and data engineers community

## Introduction

The Data Store API Specification (DSAS) defines a standard, language-agnostic interface to a Data API which allows both humans and computers to understand how to establish a connection and query a database service managing tabular data without access to source code, documentation, or through network traffic inspection. When properly defined, a consumer can understand and interact with the remote database service with a minimal amount of implementation logic.

A Data Store API definition can then be used by documentation generation tools to display the API, code generation tools to generate servers and clients in various programming languages, testing tools, and many other use cases.  


## Table of Contents

- [Data Store API Specification](#data-store-api-specification)
      - [Version 1.0.0-DRAFT](#version-100-draft)
      - [Disclaimer](#disclaimer)
  - [Introduction](#introduction)
  - [Table of Contents](#table-of-contents)
  - [Definitions](#definitions)
        - [Standard](#standard)
        - [Standard Specification](#standard-specification)
        - [Standard Definition](#standard-definition)
        - [Database Management System](#database-management-system)
        - [Database Service](#database-service)
        - [Database](#database)
        - [Data Store API](#data-store-api)
        - [Data Store API Document](#data-store-api-document)
        - [Data Store API Specification](#data-store-api-specification-1)
  - [Specification](#specification)
    - [ Versions](#-versions)
    - [ Format](#-format)
    - [Document Structure](#document-structure)
    - [Object Types](#object-types)
    - [Data Types](#data-types)
    - [Rich Text Formatting](#rich-text-formatting)
    - [Relative References in URLs](#relative-references-in-urls)
    - [Schema](#schema)
      - [Data Store API Entity](#data-store-api-entity)
      - [Info Object](#info-object)
      - [Contact Object](#contact-object)
      - [License Object](#license-object)
      - [Database Services Object](#database-services-object)
      - [Database Service Object](#database-service-object)
      - [Server Info Object](#server-info-object)
      - [Connection Protocols Object](#connection-protocols-object)
      - [JDBC Connection Protocol Object](#jdbc-connection-protocol-object)
      - [ODBC Connection Protocol Object](#odbc-connection-protocol-object)
      - [Variable Object](#variable-object)
      - [Schema Object](#schema-object)
      - [Table Entity](#table-entity)
      - [Table Constraint Object](#table-constraint-object)
      - [Table Partition Object](#table-partition-object)
      - [Column Object](#column-object)
      - [Components Object](#components-object)
      - [Reference Object](#reference-object)
      - [External Resource Object](#external-resource-object)
      - [Standard Definition Object](#standard-definition-object)
    - [Specification Extensions](#specification-extensions)
  - [Appendix A: Revision History](#appendix-a-revision-history)

## Definitions

##### <a name="definitionsStandard"></a>Standard
The set of shared rules used by different agents to describe an entity or process of common interest. The agents that follow the standard limit their autonomy by conforming to the set of shared rules in order to facilitate cooperation between them through interoperability.

##### <a name="definitionsSpecification"></a>Standard Specification
The formal description of the rules that form a [standard](#definitionsStandard). A standard can have multiple specification versions associated with it. Sometimes the words standard and specification are used as synonymous. 

##### <a name="definitionsDefinition"></a>Standard Definition
The description of one specific entity or process created using and conforming to the set of rules formally described in the [standard specification](#definitionsSpecification)

##### <a name="definitionsDatabaseManagementSystem"></a>Database Management System
An application that is capable of storing and providing access to data organized in tabular format (ex. MySql, SQLServer, Snowflake, etc...)

##### <a name="definitionsDatabaseService"></a>Database Service
An addressable running instance of a [Database Management System](#definitionsDatabaseManagementSystem). Consumers can connect to it through one or many connection protocols (ex. JDBC, ODBC, etc...) and perform queries over tabular data managed by the service. The supported query language depends on the specific [Database Management System](#definitionsDatabaseManagementSystem) (ex. SQL).

##### <a name="definitionsDatabase"></a>Database
A named collection of tables physically stored and exposed to consumers by a [Database Service](#definitionsDatabaseService). In some [Database Management Systems](#definitionsDatabaseManagementSystem) tables in a database are further grouped in *schemas*.

##### <a name="definitionsDataStoreAPI"></a>Data Store API
The description of the structure of a collection of tables (i.e. *data store schema*) together with the [Database Services](#definitionsDatabaseService) (i.e. *data store services*) that store them in the different environments that compose the application landscape (ex. dev, qa, prod, etc...). Consumers can connect to data store services through one of the supported protocols and use the data store schema to compose valid queries. The structure of the tables that compose a data store API is the same in all environments so the same queries can be executed against all the services independently from the specific environment. The stored data is anyway usually not the same (i.e. dev data is usually different from prod data) so are the query results.

##### <a name="definitionsDataStoreAPIDocument"></a>Data Store API Document
The document (or set of documents) that contains the standard definition of a [Data Store API](#definitionsDataStoreAPI) created using and conforming to the [Data Store API Specification](definitionsDataStoreAPISpecification).

##### <a name="definitionsDataStoreAPISpecification"></a>Data Store API Specification
The formal description of the rules to follow in order to create a standard-compliant [Data Store API Document](definitionsDataStoreAPIDocument). 


## Specification

### <a name="versions"></a> Versions

The Data Store API Specification is versioned using [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html) (semver) and follows the semver specification.

The `major`.`minor` portion of the semver (for example `1.0`) SHALL designate the dsapi feature set. Typically, *`.patch`* versions address errors in this document, not the feature set. Tooling which supports dsapi 1.0 SHOULD be compatible with all dsapi 1.0.\* versions. The patch version SHOULD NOT be considered by tooling, making no distinction between `1.0.0` and `1.0.1` for example.

Each new minor version of the Data Store API Specification SHALL allow any Data Store API document that is valid against any previous minor version of the Specification, within the same major version, to be updated to the new Specification version with equivalent semantics. Such an update MUST only require changing the `datastoreapi` property to the new minor version.

For example, a valid Data Store API 1.0.2 document, upon changing its `datastoreapi` property to `1.1.0`, SHALL be a valid Data Store API 1.1.0 document, semantically equivalent to the original Data Store API 1.0.2 document. New minor versions of the Data Store API Specification MUST be written to ensure this form of backward compatibility.


### <a name="format"></a> Format

A [Data Store API Document](#definitionsDataStoreAPIDocument) that conforms to the [Data Store API Specification](#definitionsDataStoreAPISpecification) is itself a JSON object, which may be represented either in JSON or YAML format.

For example, if a field has an array value, the JSON array representation will be used:

```json
{
   "field": [ 1, 2, 3 ]
}
```
All field names in the specification are **case-sensitive**.
This includes all fields that are used as keys in a map, except where explicitly noted that keys are **case insensitive**.

The schema exposes two types of fields: Fixed fields, which have a declared name, and Patterned fields, which declare a regex pattern for the field name.

Patterned fields MUST have unique names within the containing object. 

In order to preserve the ability to round-trip between YAML and JSON formats, YAML version [1.2](https://yaml.org/spec/1.2/spec.html) is RECOMMENDED along with some additional constraints:

- Tags MUST be limited to those allowed by the [JSON Schema ruleset](https://yaml.org/spec/1.2/spec.html#id2803231).
- Keys used in YAML maps MUST be limited to a scalar string, as defined by the [YAML Failsafe schema ruleset](https://yaml.org/spec/1.2/spec.html#id2802346).


### <a name="documentStructure"></a>Document Structure

A [Data Store API Document](#definitionsDataStoreAPIDocument) MAY be made up of a single document or be divided into multiple, connected parts at the discretion of the user. In the latter case, `$ref` fields MUST be used in the specification to reference those parts as follows from the [JSON Schema](https://json-schema.org) definitions.

It is RECOMMENDED that the root [Data Store API Document](#definitionsDataStoreAPIDocument) be named: `datastoreapi.json` or `datastoreapi.yaml`.

### <a name="objectTypes"></a>Object Types

A [Data Store API Document](#definitionsDataStoreAPIDocument) has one and only one root object. The properties of an object are described by its fields. A field type can be another object or a [primitive type](#dataTypeFormat). An addressable and versioned object is called entity. The root object of the [Data Store API Document](#definitionsDataStoreAPIDocument) is an entity object. Other entities that exist only in the scope of the root entity are called components.

### <a name="dataTypes"></a>Data Types

Primitive data types in the dsapi are based on the types supported by the [JSON Schema Specification Wright Draft 00](https://tools.ietf.org/html/draft-wright-json-schema-00#section-4.2). 


<a name="dataTypeFormat"></a>Primitives have an optional modifier property: `format`.
dsapi uses several known formats to define in fine detail the data type being used.
However, to support documentation needs, the `format` property is an open `string`-valued property and can have any value.
Formats such as `"email"`, `"uuid"`, and so on, MAY be used even though undefined by this specification.
Types that are not accompanied by a `format` property follow the type definition in the JSON Schema. Tools that do not recognize a specific `format` MAY default back to the `type` alone as if the `format` is not specified.

The formats defined by the dsapi are:

[`type`](#dataTypes) | [`format`](#dataTypeFormat) | Comments
------ | -------- | --------
`integer` | `int32` | signed 32 bits
`integer` | `int64` | signed 64 bits (a.k.a. long)
`number` | `float` | |
`number` | `double` | |
`string` | | |
`string` | `alphanumeric` | a string that match the following regex `^[a-zA-Z0-9]+$`
`string` | `name` | a string that match the following regex `^[a-zA-Z][a-zA-Z0-9]+$`
`string` | `fqn` | a string that match the following regex `^[a-zA-Z][a-zA-Z0-9.:]+$`
`string` | `version` | a string that match the following regex `^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$`
`string` | `byte` | base64 encoded characters
`string` | `binary` | any sequence of octets
`string` | `uuid` | a sequence of 16 octets as defined by [RFC4122](https://www.rfc-editor.org/rfc/rfc4122.html)
`boolean` | | |
`string` | `date` | As defined by `full-date` - [RFC3339](https://xml2rfc.ietf.org/public/rfc/html/rfc3339.html#anchor14)
`string` | `date-time` | As defined by `date-time` - [RFC3339](https://xml2rfc.ietf.org/public/rfc/html/rfc3339.html#anchor14)
`string` | `password` | A hint to UIs to obscure input.


### <a name="richText"></a>Rich Text Formatting
Throughout the specification, `description` fields are noted as supporting CommonMark markdown formatting.
Where Data Product Descriptor tooling renders rich text it MUST support, at a minimum, markdown syntax as described by [CommonMark 0.27](https://spec.commonmark.org/0.27/). Tooling MAY choose to ignore some CommonMark features to address security concerns. 

### <a name="relativeReferences"></a>Relative References in URLs

Unless specified otherwise, all properties that are URLs SHOULD be absolute references. If a property explicitly specifies in its description that allows a relative reference its value MUST be compliant with [RFC3986](https://tools.ietf.org/html/rfc3986#section-4.2). Relative references MUST be resolved using the URLs defined in the property description as a Base URI.

Relative references used in `$ref` are processed as per [JSON Reference](https://tools.ietf.org/html/draft-pbryan-zyp-json-ref-03), using the URL of the current document as the base URI. See also the [Reference Object](#referenceObject).


### Schema

In the following description, if a field is not explicitly **REQUIRED** or described with a MUST or SHALL, it can be considered OPTIONAL.


#### <a name="dataStoreAPIEntity"></a>Data Store API Entity

This is the root object of the [Data Store API Document](#definitionsDataStoreAPIDocument).


##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="dsasVersion"></a>datastoreapi | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the [Data Store API Specification Version](#versions) that the [Data Store API Document](#definitionsDataStoreAPIDocument) uses. The [`datastoreapi`](#dsasVersion) field SHOULD be used by tooling specifications and clients to interpret the [Data Store API Document](#definitionsDataStoreAPIDocument). This is *not* related to the data product [`version`](#dsapiVersion) field.
<a name="dsasInfo"></a>info | [Info Object](#infoObject) | **(REQUIRED)** Provides metadata about the API. The metadata MAY be used by tooling as required.
<a name="dsasDatabaseServices"></a>services | [Database Services Object](#databaseServicesObject) | **(REQUIRED)** Provides connection details of services that expose the data of this data store in all the supported environments.
<a name="dsasSchema"></a>schema | [Schema Object](#schemaObject) | **(REQUIRED)** Provides a description of the structure of  all the tables that compose this data store.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

#### <a name="infoObject"></a>Info Object

The `Info Object` provides metadata about the API. The metadata can be used by the platform or by consumers if needed.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="infoTitle"></a>title | `string` | **(REQUIRED)** The title of the API.
<a name="infoSummary"></a>summary | `string` | The short summary of the API.
<a name="infoDescription"></a>description | `string` | The description of the API. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="infoTermsOfService"></a>termsOfService | `string` | The URL to the terms of service for the API. This MUST be in the form of a URL.
<a name="infoVersion"></a>version | `string:version` | **(REQUIRED)** The version of the [Data Store API Document](#definitionsDataStoreAPIDocument) (which is distinct from the [Data Store API Specification version](#dsasVersion) or the API implementation version).
<a name="infoDatastoreName"></a>datastoreName | `string:name` | The name of the [datastore](#definitionsDatastore) exposed by this API.
<a name="infoContact"></a>contact | [Contact Object](#contactObject) | The contact information for this API.
<a name="infoLicense"></a>license | [License Object](#licenseObject) | The license information for this API.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Info Object Example

```json
{
  "title": "Foodmart Sales Data Store",
  "summary": "The sales datamart",
  "description": "This fact table store all the sales of last five years together with key analysis dimensions (ex. customer, products, etc...)",
  "termsOfService": "https://foodmart.com/terms/",
  "contact": {
    "name": "API Support",
    "url": "https://www.foodmart.com/support",
    "email": "support@foodmart.com"
  },
  "license": {
    "name": "Apache 2.0",
    "url": "https://www.apache.org/licenses/LICENSE-2.0.html"
  },
  "version": "1.1.1"
}
```

#### <a name="contactObject"></a>Contact Object

Contact information for the exposed API.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="contactObjectName"></a>name | `string` | The identifying name of the contact person/organization.
<a name="contactObjectUrl"></a>url | `string` | The URL pointing to the contact information. MUST be in the format of a URL.
<a name="contactObjectEmail"></a>email | `string` | The email address of the contact person/organization. MUST be in the format of an email address.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Contact Object Example:

```json
{
  "name": "API Support",
  "url": "https://www.example.com/support",
  "email": "support@example.com"
}
```

#### <a name="licenseObject"></a>License Object

License information for the exposed API.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="licenseObjectName"></a>name | `string` | **(REQUIRED)** The license name used for the API.
<a name="licenseObjectUrl"></a>url | `string` | A URL to the license used for the API. MUST be in the format of a URL.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### License Object Example:

```json
{
  "name": "Apache 2.0",
  "url": "https://www.apache.org/licenses/LICENSE-2.0.html"
}
```

#### <a name="databaseServicesObject"></a>Database Services Object

The `Database Services Object` maps database services to supported environments (ex. dev, test, prod, etc.). 

##### Patterned Fields

Field Name | Type | Description
---|:---:|---
<a name="databaseServicesObjectService"></a> - | Map[`string`,[Database Service Object](#databaseServiceObject) \| [Reference Object](#referenceObject) ] | The definition of a server that exposes the API in specific environment.

##### Servers Object Example

```json
{
	"development": {
	  "$ref": "#components.services.foodmartDevelopmentService"
	},
	"production": {
	  "$ref": "#components.services.foodmartProductionService"
	}
}
```

#### <a name="databaseServiceObject"></a>Database Service Object

The `Database Service Object` describes a database service and provides all the information required to establish a connection to it.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="databaseServiceName"></a>name | `string:name` | **(REQUIRED)** The name of the service. It MUST be unique withing the services available for the API. It is RECOMMENDED to use a unique name for all services running in the application landscape.  
<a name="databaseServiceDescription"></a>description | `string` | An optional string describing the service. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="databaseServiceServerInfo"></a>serverInfo | [Server Info Object](#serverInfoObject) \| [Reference Object](#referenceObject) | Contains basic information about the Database Server.
<a name="databaseServiceVariables"></a>variables | Map[`string`, [Variable Object](#variableObject)] | The map between a variable name and its value.  The value is used for substitution in the protocols' `connectionString` template.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Database Service Object Example

The following shows an example of `Database Service Object`, including how variables can be used for a server configuration:

```json
{
  "name:": "SALES Data Store Service",
  "description": "The service that host the `SALES` data store in the given environment",
  "serverInfo": {
      "host:": "{host}",
      "port:": "5432",
      "dbmsType:": "Postgres",
      "dbmsVersion:": "15 RC 2",
      "connectionProtocols": {
        "jdbc": {
          "version": "1.0",
          "url": "jdbc:postgresql://{hosts}:5432/foodmart",
          "driverName": "PostgreSQL JDBC Driver",
          "driverClass": "org.postgresql.Driver",
          "driverVersion": "42.2.20"
        }
      }
  },
  "variables": {
    "host": "ip-10-24-32-0.ec2.internal"
  }
}	 
```

#### <a name="serverInfoObject"></a>Server Info Object

The `Server Info Object` contains basic information about the Database Server.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="serverInfoHost"></a>host | `string` | **(REQUIRED)** The hostname of the server running the service. It SHOULD follow the guidelines described in [RFC1178](https://datatracker.ietf.org/doc/html/rfc1178).
<a name="serverInfoPort"></a>port | `string` | **(REQUIRED)** The port on whitch the service is listening on for incoming request.
<a name="serverInfoDBMSType"></a>dbmsType | `string` | The type of [database management system](#definitionsDatabaseManagementSystem) run by the service (ex. `MySQL`, `Postgres`, `Oracle`, ecc...).
<a name="serverInfoDBMSVersion"></a>dbmsVersion | `string` | The version of [database management system](#definitionsDatabaseManagementSystem) run by the service (ex. ` 8.0.31`, `15 RC 2`, `19c`, ecc...).
<a name="serverInfoConnectionProtocols"></a>connectionProtocols | [Connection Protocols Object](#connectionProtocolsObject) | **(REQUIRED)** The available protocols to connect to the service.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Server Info Object Example

The following shows an example of `Server Info Object`, including an example of how variables can be used for a server configuration:

```json
{
    "host:": "{host}",
    "port:": "5432",
    "serviceType:": "Postgres",
    "serviceVersion:": "15 RC 2",
    "connectionProtocols": {
      "jdbc": {
        "version": "1.0",
        "url": "jdbc:postgresql://{hosts}:5432/foodmart",
        "driverName": "PostgreSQL JDBC Driver",
        "driverClass": "org.postgresql.Driver",
        "driverVersion": "42.2.20"
      }
    }
}
```

#### <a name="connectionProtocolsObject"></a>Connection Protocols Object

Describes protocol-specific configurations for all connection protocols supported by a service.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="connectionProtocolsJDBC"></a>jdbc | [JDBC Connection Object](#jdbcConnectionProtocolObject) | Protocol-specific information for a JDBC connection to the service.
<a name="connectionProtocolsODBC"></a>odbc | [ODBC Connection Object](#odbcConnectionProtocolObject) | Protocol-specific information for a ODBC connection to the service.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="jdbcConnectionProtocolObject"></a>JDBC Connection Protocol Object

The `JDBC Connection Object` contains the required information to create a JDBC connection to the service.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="jdbcConnectionProtocolVersion"></a>version | `string` | The version of the protocol used for connection (ex. `JDBC 4.3`).
<a name="jdbcConnectionProtocolConnectionString"></a>connectionString | `string` | **(REQUIRED)**. The string that contains all the required information to connect to the service (ex. `jdbc:postgresql://192.168.1.170:5432/sample?ssl=true`). This string supports [Variables]. Variable substitutions will be made when a variable is named in `{`brackets`}`.
<a name="jdbcConnectionProtocolDriverName"></a>driverName | `string` | The name of the JDBC driver to use for establishing a connetion with the service (ex. `PostgreSQL JDBC Driver`).
<a name="jdbcConnectionProtocolDriverClass"></a>driverClass | `string` | The java class of the JDBC driver to use for establishing a connetion with the service (ex. `org.postgresql.Driver`).
<a name="jdbcConnectionProtocolDriverVersion"></a>driverVersion | `string` | The version of the JDBC driver to use for establishing a connetion with the service (ex. `42.2.20`).
<a name="jdbcConnectionProtocolDriverLibrary"></a>driverLibrary | [External Resource Object](#externalResourceObject) | The JDBC driver library.
<a name="odbcConnectionProtocolDriverDocs"></a>driverDocs | [External Resource Object](#externalResourceObject) | The JDBC driver documentation.


This object MAY be extended with [Specification Extensions](#specificationExtensions).


##### JDBC Connection Protocol Object Example

The following shows an example of JDBC connection information to a PostgreSQL database service:

```json
{
  "version": "1.0",
  "url": "jdbc:postgresql://{hosts}:5432/foodmart",
  "driverName": "PostgreSQL JDBC Driver",
  "driverClass": "org.postgresql.Driver",
  "driverVersion": "42.2.20",
  "driverLibrary": {
    "description": "PostgreSQL JDBC Driver Library",
    "mediaType": "application/java-archive",
    "$href": "https://jdbc.postgresql.org/"
   },
   "driverDocs": {
    "description": "PostgreSQL JDBC Driver HomePage",
     "mediaType": "text/html",
     "$href": "https://jdbc.postgresql.org/postgresql-15RC2.jdbc3.jar"
  }
}
```

#### <a name="odbcConnectionProtocolObject"></a>ODBC Connection Protocol Object

The `ODBC Connection Object` contains the required information to create an ODBC connection to the service.

Field Name | Type | Description
---|:---:|---
<a name="odbcConnectionProtocolVersion"></a>version | `string` | The version of the protocol used for connection (e.g. `ODBC 4.0`).
<a name="odbcConnectionProtocolConnectionString"></a>connectionString | `string` | **(REQUIRED)**. The string that contains all the required information to connect to the service (ex. `Driver={ODBC Driver 13 for SQL Server};server=localhost;database=WideWorldImporters;trusted_connection=Yes;`). This string supports [Variables]. Variable substitutions will be made when a variable is named in `{`brackets`}`.
<a name="odbcConnectionProtocolDriverName"></a>driverName | `string` | The name of the ODBC driver to use for establishing a connetion with the service (ex. `psqlODBC`).
<a name="odbcConnectionProtocolDriverVersion"></a>driverVersion | `string` | The version of the ODBC driver to use for establishing a connetion with the service (ex. `13.02`).
<a name="odbcConnectionProtocolDriverLibrary"></a>driverLibrary | [External Resource Object](#externalResourceObject) | The ODBC driver library.
<a name="odbcConnectionProtocolDriverDocs"></a>driverDocs | [External Resource Object](#externalResourceObject) | The ODBC driver documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

#### <a name="variableObject"></a>Variable Object

The `Variable Object` represents a Variable for server URL template substitution.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="variableDescription"></a>description | `string` | The optional description for the server variable. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="variableEnum"></a>enum | [`string`] | The enumeration of string values to be used if the substitution options are from a limited set.
<a name="variableDefault"></a>default | `string` | The default value to use for substitution, and to send, if an alternate value is _not_ supplied.
<a name="variableExamples"></a>examples | [`string`] | The array of examples of the server variable.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="schemaObject"></a>Schema Object

The `Schema Object` describes the structure of the tables exposed by this API.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="schemaDatabaseName"></a>databaseName | `string` | **(REQUIRED)** The name of the [Database](#definitionsDatabase) that collects the tables exposed by this Data Store API.
<a name="schemaDatabaseSchemaName"></a>databaseSchemaName | `string` | The name of the *schema* that collects the tables exposed by this Data Store API. This field is used only for [Database Management System](#definitionsDatabaseManagementSystem) that group table within a [Database](#definitionsDatabase) in schemas. 
<a name="schemaTables"></a>tables | \[[Table Entity](#tableEntity)\| [Standard Definition Object](#standardDefinitionObject) \| [Reference Object](#referenceObject)\] | The tables exposed by this Data Store API.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Schema Object Example

```json
{
  "databaseName": "foodmartdb",
  "databaseSchemaName": "dwh",
  "tables": [
    {
      "$ref": "#components.tables.sales"
    },
    {
      "$ref": "#components.services.customers"
    },
    {
      "$ref": "#components.services.products"
    }
  ]
}
```


#### <a name="tableEntity"></a>Table Entity

The `Table Entity` describes the structure of a table. This entity's fields are a superset of the ones defined by [Table Object](https://github.com/open-metadata/OpenMetadata/blob/0.12.1-release/openmetadata-spec/src/main/resources/json/schema/entity/data/table.json) of [Open Metadata v0.12.1](https://github.com/open-metadata/OpenMetadata/tree/0.12.1-release/). By consequence, [Open Metadata](https://github.com/open-metadata/OpenMetadata/tree/0.12.1-release/) v0.12.1](https://github.com/open-metadata/OpenMetadata/tree/0.12.1-release/) tables are also valid entities usable to describe the schema of a Data Store API.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="tableId"></a>id | `string:uuid` | **(READONLY)** The UUID generated server side by applications that work with the table entity. A specific application MUST returns always the same UUID for a given table identified by its `fullyQualifiedName`. Anyway, different applications MAY use different UUID for the same table. The UUID generated by an application MAY be used to identify the table in subsequent calls to the same application API in place of the more verbose `fullyQualifiedName`. The UUID generated by one application SHALL NOT be used to identify the table when calling the API exposed by another application. It is RECOMMENDED the usage by applications of an UUID version 3 ([RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated as SHA-1 hash of the table's `fullyQualifiedName`.
<a name="tableFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(REQUIRED)** The fully qualified name of the table built by concatenation of [`datastoreName`](#infoDatastoreName),[`databaseName`](#schemaDatabaseName) and [`tableName`](#tableName). It is RECOMMENDED to use an unique universal identifier of the form `urn:dsas:{org-namespace}:tables:{`[`datastoreName`](#infoDatastoreName)`}:{`[`databaseName`](#schemaDatabaseName)`}:{`[`tableName`](#tableName)`}:{table-major-version}`. It's RECOMMENDED to use as `org-namespace` your company's domain name in reverse dot notation (es `it.quantyca`) in order to ensure that the `fullyQualifiedName` is unique universal idetifier. Example:  `"fullyQualifiedName": "urn:dsas:it.quantyca:tables:mysqld-prod:dwh:sales:1"`. For inbound compatibility with [Open Metadata v0.12.1](https://github.com/open-metadata/OpenMetadata/tree/0.12.1-release/) the `fullyQualifiedName` MAY also be in the simpler form of [`datastoreName`](#infoDatastoreName).[`databaseName`](#schemaDatabaseName).[`tableName`](#tableName). Example:  `"fullyQualifiedName": "mysqld-prod.dwh.sales"`.
<a name="tableEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The name of the entity used by applications that work with the table entity. Different applications MAY use different entity names to refer to table entity. It's RECOMMENDED to use as `entityName` the name of the resource exposed by the application's Restful API to execute CRUD operations over the entity itself.
<a name="tableName"></a>name | `string` | The local name (i.e. not fully qualified name) of the table. It MUST be unique within the tables of the same database or schema.
<a name="tableVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the table.
<a name="tableDisplayName"></a>displayName | `string` | The human readable name of the table. It SHOULD be used by frontend tool to visualize table's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different table belonging to the same database.
<a name="tableDescription"></a>description | `string` | The table descripion. [CommonMark syntax](https://spec.commonmark.org/). It MAY be used for rich text representation.
<a name="tableType"></a>tableType | `string` | The table type. Admissible values are: `EXTERNAL`, `VIEW`, `SECUREVIEW`, `MATERIALIZEDVIEW`, `ICEBERG`, `LOCAL`, `PARTITIONED`.
<a name="tableColumns"></a>columns | \[[Column Object](#columnObject)\] | The list of columns associated to the table.
<a name="tableConstraints"></a>constraints | \[[Table Constraint Object](#tableConstraintObject)\] | The table constraints (ex. referential integrity constraints, uniqueness constraints, ecc...). 
<a name="tablePartition"></a>partitions | \[[Table Partition Object](#tablePartitionObject)\] | The information related to table's partition if the table is partitionated.
<a name="tableTags"></a>tags | \[`string`\] | The list of tags associated to the table.
<a name="tableExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Schema Object Example

```json
{
  "name": "sales_fact_dec_1998",
  "version": "1.0.0",
  "fullyQualifiedName": "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.1",
  "displayName": "Foodmart Sales Fact Table",
  "description": "The fact table that store all sales of 1998",
  "tableType": "LOCAL",
  "constraints": [
    {
      "constraintType": "PRIMARY_KEY",
      "columns": [
        "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.customer_id",
        "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.product_id"
      ]
    }, {
      "constraintType": "FOREIGN_KEY",
      "columns": [
        "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.customer_id",
        "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.customer.customer_id"
      ]
    }, {
      "constraintType": "FOREIGN_KEY",
      "columns": [
        "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.customer_id",
        "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.product.product_id"
      ]
    }
  ],
  "columns": [
    {
      "name": "customer_id",
      "fullyQualifiedName": "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.customer_id",
      "displayName": "Customer ID",
      "dataType": "INTEGER",
      "columnConstraint": "PRIMARY_KEY",
      "ordinalPosition": 1
    }, {
      "name": "product_id",
      "fullyQualifiedName": "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.product_id",
      "displayName": "Product ID",
      "dataType": "INTEGER",
      "columnConstraint": "PRIMARY_KEY",
      "ordinalPosition": 2
    }, {
      "name": "store_sales",
      "fullyQualifiedName": "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.store_sales",
      "displayName": "Store Sales",
      "dataType": "DECIMAL",
      "precision": "10",
      "scale": "4",
      "columnConstraint": "NOT NULL",
      "ordinalPosition": 3
    }, {
      "name": "store_cost",
      "fullyQualifiedName": "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.store_cost",
      "displayName": "Store Cost",
      "dataType": "DECIMAL",
      "precision": "10",
      "scale": "4",
      "columnConstraint": "NOT NULL",
      "ordinalPosition": 4
    }, {
      "name": "unit_sales",
      "fullyQualifiedName": "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.unit_sales",
      "displayName": "Store Cost",
      "dataType": "DECIMAL",
      "precision": "10",
      "scale": "4",
      "columnConstraint": "NOT NULL",
      "ordinalPosition": 5
    }
  ]
}
```

#### <a name="tableConstraintObject"></a>Table Constraint Object

The `Table Constraint Object` describes a constraint defined at table level.

##### Fixed Fields
Field Name | Type | Description
---|:---:|---
<a name="tableConstraintType"></a>constraintType | `string` | Type of constraint. Admissible values are: `UNIQUE`, `PRIMARY_KEY`, `FOREIGN_KEY`.
<a name="tableConstraintcolumns"></a>columns | \[`string:fqn`\] | List of column [`fullyQualifiedNames`](#tableFullyQualifiedName) corresponding to the constraint.

##### Table Constraint Object Example

The following shows an example of a composed primary key defined on columns customer_id and product_id.

```json
{
  "constraintType": "PRIMARY_KEY",
  "columns": [
    "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.customer_id",
    "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.product_id"
  ]
}
```

The following shows an example of a foreign key defined column customer_id that referentiates column customer_id of table customer.

```json
{
  "constraintType": "FOREIGN_KEY",
  "columns": [
    "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.sales_fact_dec_1998.customer_id",
    "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.customer.customer_id"
  ]
}
```

#### <a name="tablePartitionObject"></a>Table Partition Object

The `Table Partition Object` describes a constraint defined at table level.

##### Fixed Fields
Field Name | Type | Description
---|:---:|---
<a name="tablePartitionColumns"></a>columns | \[`string:fqn`\] | List of column [`fullyQualifiedNames`](#tableFullyQualifiedName) corresponding to the partition.
<a name="tablePartitionIntervalType"></a>intervalType | `string` | type of partition interval. Admissible values are: `TIME-UNIT`, `INTEGER-RANGE`, `INGESTION-TIME`, `COLUMN-VALUE`.
<a name="tablePartitionInterval"></a>interval | `string` | partition interval , example hourly, daily, monthly.


#### <a name="columnObject"></a>Column Object

The `Column Object` describes a column of a database's table.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="columneName"></a>name | `string` | The local name (i.e. not fully qualified name) of the column. It is equals to `-` when the column is not named in struct `dataType`. For example, *BigQuery* supports struct with unnamed fields. In other cases it MUST be unique within a table.
<a name="columneDisplayName"></a>displayName | `string` | The human readable name of the column. It MAY be used by frontend tool to visualize column's name in place of the `name` property. It's RECOMMENDED to not use the same `displayName` for different columns belonging to the same table.
<a name="columnFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(REQUIRED)** The fully qualified name of the column built by concatenation of [`table.fullyQualifiedName`](#tableFullyQualifiedName) and [`column.name`](#columnName). It is RECOMMENDED to use an unique universal idetifier of the form `urn:dsas:{org-namespace}:tables:{`[`table.fullyQualifiedName`](#tableFullyQualifiedName)`}:{`[`column.name`](#columneName)`}`. It's RECOMMENDED to use as `org-namespace` your company's domain name in reverse dot notation (es `it.quantyca`) in order to ensure that the `fullyQualifiedName` is unique universal idetifier. Example:  `"fullyQualifiedName": "urn:dsas:it.quantyca:tables:mysqld-prod:dwh:sales:1:productId"`. For inbound compatibility with [Open Metadata v0.12.1](https://github.com/open-metadata/OpenMetadata/tree/0.12.1-release/) the `fullyQualifiedName` MAY also be in the simpler form of [`datastoreName`](#infoDatastoreName).[`databaseName`](#schemaDatabaseName).[`tableName`](#tableName).[`columnName`](#columnName). Example:  `"fullyQualifiedName": "mysqld-prod.dwh.sales.productId"`.
<a name="columneDescription"></a>description | `string` | Description of a column.
<a name="columnDataType"></a>dataType | `string` | Data type of the column. Admissible values are: `NUMBER`, `TINYINT`, `SMALLINT`, `INT`, `BIGINT`, `BYTEINT`, `BYTES`, `FLOAT`, `DOUBLE`, `DECIMAL`, `NUMERIC`, `TIMESTAMP`, `TIME`, `DATE`, `DATETIME`, `INTERVAL`, `STRING`, `MEDIUMTEXT`, `TEXT`, `CHAR`, `VARCHAR`, `BOOLEAN`, `BINARY`, `VARBINARY`, `ARRAY`, `BLOB`, `LONGBLOB`, `MEDIUMBLOB`, `MAP`, `STRUCT`, `UNION`, `SET`, `GEOGRAPHY`, `ENUM`, `JSON`
<a name="columnDataLength"></a>dataLength | `integer` | Length of `CHAR`, `VARCHAR`, `BINARY`, `VARBINARY` `dataTypes`, else `null`. For example, `VARCHAR(20)` has `dataType` as `VARCHAR` and `dataLength` as `20`.
<a name="columnPrecision"></a>precision | `integer` | The precision of a numeric is the total count of significant digits in the whole number, that is, the number of digits to both sides of the decimal point. Precision is applicable *integer types*, such as `INT`, `SMALLINT`, `BIGINT`, etc. It also applies to other Numeric types, such as `NUMBER`, `DECIMAL`, `DOUBLE`, `FLOAT`, etc.
<a name="columnDataLength"></a>scale | `integer` | The scale of a numeric is the count of decimal digits in the fractional part, to the right of the decimal point. For *integer types*, the scale is `0`. It mainly applies to *non integer numeric types*, such as `NUMBER`, `DECIMAL`, `DOUBLE`, `FLOAT`, etc.
<a name="columnJsonSchemae"></a>jsonSchema | `string` | The JSON Schema of the column only if the [`dataType`](#columnDataType) is equals to `JSON`, else `null`.
<a name="columnConstraint"></a>columnConstraint | `string` | The column level constraint. Admissible values are:  `NULL`, `NOT_NULL`, `UNIQUE`, `PRIMARY_KEY`.
<a name="columnOrdinalPosition"></a>ordinalPosition | `integer` | The ordinal position of the column in the table.

##### Column Object Example

```json
{
  "name": "customer_id",
  "fullyQualifiedName": "urn:dsas:it.quantyca:tables:foodmart.foodmartdb.dwh.customer.customer_id",
  "displayName": "Customer ID",
  "dataType": "INTEGER",
  "columnConstraint": "PRIMARY_KEY",
  "ordinalPosition": 1
}
```

#### <a name="componentsObject"></a>Components Object

The `Components Object` holds a set of reusable objects for different aspects of the API.
All objects defined within the components object will have no effect on the Data Store API unless they are explicitly referenced from properties outside the components object.

##### Fixed Fields

Field Name | Type | Description
---|:---|---
<a name="#componentsServerInfo"></a> serverInfo | Map[`string`, [Server Info Object](#serverInfoObject) \| [Reference Object](#referenceObject)] | An object to hold reusable [Server Info Object](#serverInfoObject).
<a name="#componentsTables"></a> tables | Map[`string`, [Table Object](#tableObject) \| [Reference Object](#referenceObject)] | An object to hold reusable [Table Object](#tableObject).





This object MAY be extended with [Specification Extensions](#specificationExtensions).

All the fixed fields declared above are objects that MUST use keys that match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.

#### <a name="referenceObject"></a>Reference Object

The `Reference Object` allows referencing other components in the [Data Store API Document](#definitionsDataStoreAPIDocument), internally and externally.

The `$ref` string value contains a URI [RFC3986](https://tools.ietf.org/html/rfc3986), which identifies the location of the value being referenced.

See the rules for resolving [Relative References](#relativeReferencesURI).

##### Fixed Fields
Field Name | Type | Description
---|:---:|---
<a name="referenceDescription"></a>description | `string` | A description which by default SHOULD override that of the referenced component. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation. If the referenced object-type does not allow a `description` field, then this field has no effect.
<a name="referenceMediaType"></a>mediaType | `string` | The media type of referenced object. It must conform to media type format, according to [RFC6838](https://www.rfc-editor.org/rfc/rfc6838).
<a name="referenceRef"></a>$ref | `string` | **(REQUIRED)** The reference identifier. This MUST be in the form of a URI.

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

The `External Resource Object` allows referencing an external resource like a documentation page or a standard definition.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="externalResourceDescription"></a>description | `string` | A description of the target resource. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation. 
<a name="externalResourceMediaType"></a>mediaType | `string` | The media type of target resource. It must conform to media type format, according to [RFC6838](https://www.rfc-editor.org/rfc/rfc6838).
<a name="externalResourceHref"></a>$href | `string:uri` | **(REQUIRED)** The URI of the target resource. It must conform to the URI format, according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986).

This object cannot be extended with additional properties and any properties added SHALL be ignored.

##### External Resource Object Example

```json
{
  "description": "Find more info here",
  "mediaType": "text",
  "$href": "https://example.com"
}
```

#### <a name="standardDefinitionObject"></a>Standard Definition Object

The `Standard Definition Object` formally describes an object (ex. table schema, etc ...) of interest following a given standard specification.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="standardDefinitionId"></a>id | `string:uuid` | **(READONLY)** It's an UUID of the definition. It is valorized server side when the object can be reused in other context (ex. a definition of a table schema used in multiple API). It is RECOMMENDED to use an UUID version 3 ([RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated  as SHA-1 hash of the concatenantion of `name` and `version` separated by `:`.
<a name="standardName"></a>name | `string:name` | The name of the defined object. It is valorized when the object can be reused in other context (ex. a definition of a table schema used in multiple API). It's RECOMMENDED to use a camel case formatted string.
<a name="standardDefinitionVersion"></a>version | `string` | The version of the defined object. t is valorized when the object can be reused in other context (ex. a definition of a table schema used in multiple API).
<a name="standardDefinitionDescription"></a>description | `string` | The standard definition descripion. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="standardDefinitionSpecification"></a>specification | `string` | **(REQUIRED)** The external specification used in the `definition`.
<a name="standardDefinitionSpecificationVersion"></a>specificationVersion | `string` | The version of the external specification used in the `definition`. If not defined the version MUST be included in the definition itself.
<a name="standardDefinitionDefinition"></a>definition | object \| `string` \| [Reference Object](#referenceObject) | **(REQUIRED)** The formal definition built using the spcification declared in the `[specification](#standardDefinitionSpecification)` field.
<a name="standardDefinitionExternalDocs"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation for the standard definition.

This object MAY be extended with [Specification Extensions](#specificationExtensions).  

##### Standard Definition Object Example:

```json
{
  "specification": "schemata",
  "specificationVersion": "1",
  "definition": {
    "mediaType": "application/x-protobuf",
    "$ref": "trip-status.proto"
  }   
} 
``` 

### <a name="specificationExtensions"></a>Specification Extensions

While the [Data Product Descriptor Specification](#definitionsdsasification) tries to accommodate most use cases, additional data can be added to extend the specification at certain points.
The extension properties are implemented as patterned fields that are always prefixed by `x-`.

Field Pattern | Type | Description
---|:---:|---
<a name="infoExtensions"></a>`^x-` | Any | Allows extensions to the Data Product Descriptor Schema. The field name MUST begin with `x-`, for example, `x-internal-id`. The value can be `null`, a primitive, an array or an object. Can have any valid JSON format value.

The extensions may or may not be supported by the available tooling, but those may be extended as well to add requested support (if tools are internal or open-sourced).

## <a name="revisionHistory"></a>Appendix A: Revision History

Version   | Date       | Notes
---       | ---        | ---
1.0.0     | 2023-Q1    | Release of the Data Store API Specification 1.0.0 