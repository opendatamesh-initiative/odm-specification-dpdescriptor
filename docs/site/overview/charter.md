# Charter

This page describes what the specification is about, its goals and its scope. Start from here to understand if this specification fits your needs or not, before deep diving into other parts of the documentation.

## Specification
The [Data Product Descriptor Specification (DPDS)](../resources/specifications/last.md) is a declarative and technology-independent *open standard* that can be used to describe a [data product](../concepts/data-product.md) in all its components through a <a href="https://www.json.org/" target="_blank">JSON :octicons-link-external-24:</a> or <a href="https://yaml.org/" target="_blank">YAML :octicons-link-external-24:</a> document. It allows human agents (e.g. analysts, data scientists, etc..) and digital agents (e.g. other data products, BI tools, planes of the underlying mesh platform, etc..) to operate, discover and access a data product. When properly defined, external agents can understand and interact with the data product with a minimal amount of cognitive load and implementation logic.

The formalization of a standard [data product descriptor document](../concepts/data-product-descriptor.md) through an open specification is useful to enable the implementation of an ecosystem of interoperable data mesh tools. The following is a non-exhaustive list of tools that can benefit from this specification:

- **catalogs** (search, document and collaborate)
- **design tools** (create new products by the composition of reusable templates)
- **lifecycle management tools** (deploy and operate)
- **access management tools** (assign/track access grants and generate client code in different languages)
- **policies checking tools** (enforce standard compliance and audit security)
- **observability tools** (monitor and detect)
- **data lineage tools** (trace data flows and perform forward/backward analysis)
- **mesh topology analysis tools** (calculate value/trust scores and detect structural problems)
- **semantic tools** (apply ontologies over mesh topology)
- **domain-specific language tool**s (create a collection of interconnected data products that implement together a specific value stream)

Check the [External Tools](../resources/tools.md) page for more information about the available tools that use the DPDS.

The [Specifications](../resources/specifications/README.md) page contains a list of pointers to all DPDS available versions. 

All DPDS versions also have an associated <a href="https://json-schema.org/" target="_blank">JSON Schema :octicons-link-external-24:</a>  to validate a data product descriptor definition against the standard specification. The [Schemas](../resources/schemas/README.md) page contains a list of pointers to the schema of each available DPDS version.

## Context
The first draft of the data product descriptor specification was created by <a href="https://www.quantyca.it/" target="_blank">Quantyca :octicons-link-external-24:</a>. Quantyca uses it in its projects, together with a custom implementation of a [data product experience plan](../concepts/meshops-platform.md#data-product-experience-plane) and [infrastructure utility plane](../concepts/meshops-platform.md#infrastructure-utility-plane) named [Open Data Mesh Platform](../resources/tools.md#open-data-mesh-platform), to manage the [data product]() lifecycle from creation till its retirement. The Open Data Mesh Platform standardizes and automates all the data product operational activities. It's a *DataOps* lightweight platform designed for data mesh or if you prefer, a [DataMeshOps platform](../concepts/data-product.md). The image below shows the high-level architecture of the Open Data Mesh Platform and how it uses the descriptor to orchestrate all the key activities related to data product lifecycle management.  

## Goals

Quantyca decided to publicly release the DPDS as an open standard under <a href="https://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache 2.0 license :octicons-link-external-24:</a> for the following reasons:

1. Get feedback from the data mesh community and practitioners on the proposed content and structure of the data product descriptor to improve it over time
1. Foster discussion about what a data product is, what are its components and how its lifecycle should be managed 
1. Provide a reference specification that can be used as is, extended or customized by the ones that need a data product descriptor for their mesh implementation
1. Try to gather and collaborate with the mesh community members that are interested in defining a base standard to describe data products on which we can then create the next generation of interoperable mesh tools.

## Principles

The following principles are adopted in the design and evolution of the specification:

1. The DPDS MUST be **declarative** 
1. The DPDS MUST be **tech indipendent**
1. The DPDS MUST be **standard agnostic**
1. The DPDS MUST be **composable through templating**
1. The DPDS MUST be **flexible in the adoption**
1. The DPDS MUST be **easily extensible**

In the design of the specification, every time different design options were possible, the principles stated above have been followed to make the final decision. These same principles will be also used to evolve the specification in future versions.

## Status
There is not yet a generally available version of the specification. Version 1.0.0 is in a DRAFT state. We plan to collect community feedback and contributions over the following months to finalize and release it in the GA state. There is not yet a planned date for the release of version 1.0.0 in GA but ideally, we would like to release it by the end of Q1 of 2023.

## Contributions
All feedback and suggestion to improve the specification are more than welcome. This is after all the reason why we open-sourced it. We are also looking for people and organizations that want to join us in this venture. Mainly this is possible in two ways:

1. helping us actively in the development and promotion of the specification
2. making your *DataMeshOps tool or platform* compliant with the specification 

The [Community](../community/README.md) page contains more information on how you can contribute to the project.

## Disclaimer
Part of the specification and related documentation has been taken from the great work done by the folks at the <a href="https://openapis.org" target="_blank">OpenAPI Initiative :octicons-link-external-24:</a> and <a href="https://www.asyncapi.com/" target="_blank">AsyncAPI Initiative :octicons-link-external-24:</a>. We have decided to not reinvent the wheel and inspire our work to these two specifications mainly for the following reasons:

- We think that the work made by OpenAPI Initiative and AsyncAPI Initiative is great  :)
- We want to make the learning curve for the Data Product Descriptor Specification as smooth as possible, aligning its definition to the one of other two popular specifications in the software and data engineers community
- We think that OpenAPI and AsyncAPI are natural specifications for defining the interface of data product's ports that expose an API endpoint. This specification does not impose to use of any specific standard for the port's interface definition but these two are highly recommended.