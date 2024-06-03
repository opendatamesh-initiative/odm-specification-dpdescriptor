# Specifications

## Main specification
The Data Product Specification (DPDS) is the main specification defined by the Open Data Mesh Initiative to describe all the components of a data product. 

DPDS defines what are the important components to describe and how they are organized within the descriptor document. 

Whenever possible the description of a component or one of its sub-parts is delegated to an independent specification defined within the Open Data Mesh Initiative (i.e. sub-specification) or by third parties (i.e. external specification).

## Sub-specifications

### Data Store API Specification⚓︎
The DatastoreAPI Specification (DSAPI) is a specification for describing, producing, consuming and visualizing connection based service that expose a tabular datastore.

???+ tip
    DPDS RECOMMEND to use this specification to define the [API](../../quickstart/interface.md#fields) of ports that expose tabular data stored in database accessible with a connection based protocol.

Check out <a href="https://github.com/opendatamesh-initiative/odm-specification-datastoreapi" target="_blank">DatastoreAPI repository:octicons-link-external-24:</a> on GitHub for further information.


## External specifications

### API

Name | Description
---|---
<a href="https://www.openapis.org/" target="_blank">OpenAPI:octicons-link-external-24:</a> | The OpenAPI Specification, previously known as the Swagger Specification, is a specification for machine-readable interface files for describing, producing, consuming and visualizing RESTful web services.
<a href="https://www.asyncapi.com/" target="_blank">AsyncAPI:octicons-link-external-24:</a> | The AsyncAPI Specification is a specification for describing, producing, consuming and visualizing asynchronous services.

???+ tip
    DPDS RECOMMEND to use OpenAPI Specification to define the [API](../../quickstart/interface.md#fields) of ports that expose RESTful services and 
    AsyncAPI Specification to define the [API](../../quickstart/interface.md#fields) of ports that expose streaming services


### Schemas

Name | Description
---|---
<a href="https://json-schema.org/" target="_blank">JSON Schema :octicons-link-external-24:</a> | A set of rules in JSON format defining the expected structure and data types for JSON data.
<a href="https://avro.apache.org/" target="_blank">Avro :octicons-link-external-24:</a> | A data contract written in a compact binary format describing the expected structure of data for efficient storage and processing.
<a href="https://developers.google.com/protocol-buffers/" target="_blank">Protobuf :octicons-link-external-24:</a> | A language-agnostic definition written in a special syntax, defining the structure, data types, and serialization of messages for efficient data exchange.

### Observability

Name | Description
---|---
<a href="https://opentelemetry.io/" target="_blank">OpenTelemetry :octicons-link-external-24:</a> | an open standard telemetry data collection
<a href="https://openlineage.io/" target="_blank">OpenLineage :octicons-link-external-24:</a> | an open standard for lineage data collection 
<a href="https://openslo.com/" target="_blank">Open SLO :octicons-link-external-24:</a> | an open standard to define Service Level Agreement


### Computational Governance

Standard | Description
---|---
<a href="https://www.openpolicyagent.org/" target="_blank">Open Policy Agent :octicons-link-external-24:</a> | Policy-based control for cloud native environments
<a href="https://greatexpectations.io/" target="_blank">Great Expectations :octicons-link-external-24:</a> | A platform to test data quality
<a href="https://www.soda.io/" target="_blank">Soda :octicons-link-external-24:</a> | A platform to test data quality




## Overlapping specifications

Name | Description
---|---
<a href="https://opendataproducts.org/" target="_blank">Open Data Product Specification:octicons-link-external-24:</a> | A data product specification
<a href="https://github.com/agile-lab-dev/Data-Product-Specification" target="_blank">Data Product Specification :octicons-link-external-24:</a> | Another data product specification (by AgileLab)
<a href="https://github.com/bitol-io/open-data-contract-standard" target="_blank">Open Data Contract Standard :octicons-link-external-24:</a> | A data contract specification (by Bitol)
<a href="https://datacontract.com/" target="_blank">Data Contract Specification :octicons-link-external-24:</a> | Another data contract specification (by INNOQ)
