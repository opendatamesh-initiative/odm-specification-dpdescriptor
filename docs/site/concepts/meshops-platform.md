# DataMeshOps Platform

It's the underlying self-serve and domain-agnostic platform that provides services to data product teams and helps the federated governance team to translate global policies into computational policies.

In the [Data Product Descriptor Specification (DPDS)](../resources/specifications/README.md) it is referred to as the *DataMeshOps Platform* or also just the *platform*. It is usually divided into three main *planes* that group functionalities with the same overall intent. Each plane is briefly described in the following sessions because it is possible to find in the DPDS specific references to these planes. 

???+ note
    The specification was created to formalize the structure and content of [data product descriptor](./data-product-descriptor.md) documents passed into a DataOps platform implemented by [Quantyca](../community/quantyca.md) for its internal projects.
    
    When the specification has been released as an open standard it has been reviewed from the inside out to remove any dependencies with the [Quantyca](../community/quantyca.md)'s platform. Moreover, the specification has been redesigned to allow the creation of [data product descriptor](#dataProductDescriptor) documents that can be used as a standard way to exchange information about [data products](#dataProduct) between all the interested parties and not only between the data product's team and the platform.


### Data Product Experience Plane

It's the platform plane that has the responsibility to provide the services that use the [data product descriptor](./data-product-descriptor.md) as input and can build, deploy and operate a [data product container](./meshops-platform.md#data-product-container).


### Infrastructure Utility Plane

It's the platform plane that has the responsibility to provide the services to access the underlying infrastructural resources. The interface of the services exposed by the infrastructure utility plane should be standardized as much as possible to decouple their consumers (i.e. the services of the [data product experience plane](./meshops-platform.md#data-mesh-experience-plane) from the actual implementation. Thanks to this decoupling it is possible to:

1. Keep other platform planes independent from the underlying technology and so making them reusable in different technological environments
1. Design the standard API of the services exposed by the infrastructure utility plane hiding all the unnecessary underlying technological complexity
1. change the implementation of the services exposed by the infrastructure utility plane without impacting the other planes

### Data Mesh Experience Plane
It's the platform plane that has the responsibility to provide the services to search, evaluate and query available data products.

## Data Product Container

It's the bundle of all resources provisioned, deployed and operated in a specific runtime environment (ex. DEV, QA, PROD) associated with a specific [data product](./data-contract.md). It can be viewed as a running instance of the [data product](./data-contract.md) described by the [data product descriptor](./data-product-descriptor.md). 

For each descriptor, multiple container instances can exist. Usually, there could be one active instance for each runtime environment and data product's major version. In other words, cannot exist multiple instances associated with a major version of a [data product](./data-contract.md) running in the same environment. It is possible anyway to have different versions of the same [data product](./data-contract.md) running together in the same environment. 

It's the responsibility of the underlying DataMeshOps platform to interpret the [data product descriptor](./data-product-descriptor.md) and properly deploy and operate the related data product containers. The DPDS is designed to guarantee that all required information needed to deploy a data product container is available in the [data product descriptor](./data-product-descriptor.md). It's not in the scope of the specification to define how the DataMeshOps platform should deploy and manage data product containers.