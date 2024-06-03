# Charter

## Mission
The Data Product Descriptor Specification (DPDS) is a declarative and technology-independent *open specification* that can be used to describe a data product in all its components 
through a JSON or YAML document. 

By promoting clear and universal data product definitions, DPDS minimizes cognitive load and streamlines implementation logic for external consumers. This fosters a world where data products can be readily understood and interacted with, unlocking their full potential.

## Scope
DPDS aims to foster a thriving ecosystem of interoperable tools to support data product lifecycle management. The following is a non-exhaustive list of tools that the specification wants to support:

- **catalogs** (search, document and collaborate)
- **design tools** (create new products by the composition of reusable templates)
- **devops management tools** (deploy and operate)
- **access management tools** (assign/track access grants and generate client code in different languages)
- **policies checking tools** (enforce standard compliance and audit security)
- **observability tools** (monitor and detect)
- **data lineage tools** (trace data flows and perform forward/backward analysis)
- **mesh topology analysis tools** (calculate value/trust scores and detect structural problems)
- **semantic tools** (apply ontologies over mesh topology)
- **domain-specific language tool**s (create a collection of interconnected data products that implement together a specific value stream)

## Values

DPDS's core values are:

* **Openness:** We encourage contributions from a wide range of participants and foster a welcoming community.
* **Transparency:** We believe in transparency. Information about the initiative, its decision-making processes, and its findings are freely available to all participants and the public.
* **Meritocracy:** We value ideas and contributions based on their quality and usefulness, regardless of the source

## Design Principles
DPDS is designed and evolves based on the following principles:

* **Simplicity and consistency over expressiveness and terseness**
    "Possible but awkward" is often favored over more complex
alternatives. Simplicity (e.g. fewer concepts) is more important than
expressing more sophisticated ideas or writing less.

* **Preserve option value**
    It's hard to know what the future brings; whenever possible, decisions should
be made that allow for more options in the future. Sometimes this is
unintuitive: spec rules often begin more strict than necessary with a future
option to loosen when motivated by a real use case.

* **Understandability is just as important as correctness**
    The DPDS spec, despite describing technical behavior, is intended to be
read by people. Use natural tone and include motivation and examples.

* **Integrates seamlessly with other specifications**
    Whenever possible, leverage existing external specifications to avoid reinventing the wheel. 
The decision to define a new part of the specification from the ground up shouldn't be taken lightly.

## Contributions
The main ways to contribute are described in [CONTRIBUTING.md](CONTRIBUTING.md). 

All contributors must respect the [Code of Conduct](https://github.com/opendatamesh-initiative/.github/blob/main/CODE_OF_CONDUCT.md) and be familiar with the project's [governance rules](GOVERNANCE.md). 

The process to propose a change to the specification is described in [DEVELOPMENT.md](DEVELOPMENT.md)

## History
DPDS was originally created by [Quantyca](https://www.quantyca.it/). 

Quantyca uses DPDS in its projects, together with a custom implementation of a _data product experience plan_ and _infrastructure utility plane_ named *Open Data Mesh Platform*, to manage the data product lifecycle from creation till its retirement. The Open Data Mesh Platform standardizes and automates all the data product operational activities. It's a *DataOps* lightweight platform designed for data mesh or if you prefer, a DataMeshOps platform. 

Quantyca decided to publicly release the DPDS as an open standard under <a href="https://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache 2.0</a> license for the following reasons:

1. Get feedback from the data mesh community and practitioners on the proposed content and structure of the data product descriptor to improve it over time
1. Foster discussion about what a data product is, what are its components, and how its lifecycle should be managed 
1. Provide a reference specification that can be used as is, extended, or customized by the ones that need a data product descriptor for their mesh implementation
1. Try to gather and collaborate with the mesh community members that are interested in defining a base standard to describe data products on which we can then create the next generation of interoperable mesh tools.

## Disclaimer
Part of DPDS and related documentation has been taken from the great work done by the folks at the [OpenAPI Initiative](href="https://openapis.org) and [AsyncAPI Initiative](https://www.asyncapi.com/). 
We have decided to not reinvent the wheel and inspire our work to these two specifications mainly for the following reasons:
- We think that the work made by OpenAPI Initiative and AsyncAPI Initiative is great  :)
- We want to make the learning curve for the Data Product Descriptor Specification as smooth as possible, aligning its definition to the one of other two popular specifications in the software and data engineers community
- We think that OpenAPI and AsyncAPI are natural specifications for defining the interface of data product's ports that expose an API endpoint. This specification does not impose to use of any specific standard for the port's interface definition but these two are highly recommended.
