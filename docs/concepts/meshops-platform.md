# DataMeshOps Platform

It's the underlying self serve and domain agnostic platform that provides services to data product's teams and helps the federeted governance team to translate global policies into computational policies.

In the DPDS it is referred as the *DataMeshOps platform* or also just the *platform*. It is usually devided in three main *planes* that group functionalites with the same overall intent. Each plane is briefly described in the following sessions because it is possible to find in the DPDS specific references to these planes. 

???+ note
    The specification was originally created to formalize the structure and content of a [data product descriptor](#dataProductDescriptor) documents passed into a DataOps platform implemented by [Quantyca](../contributions/README.md#quantyca) for its internal projects.
    
    When the specification has been relased as an open standard it has been reviewd from inside out in order to remove any dependencies with the [Quantyca](../contributions/README.md#quantyca)'s platform. Moreover the specification has been redesigned in order to allow the creation of [data product descriptor](#dataProductDescriptor) documents that can be used as a standard way to exchange informations about [data products](#dataProduct) beetween all the interested parties and not only between the data product's team and the platform.


### Data Product Experience Plane

It's the platform plane that have the responsability to provide the services that using the [data product descriptor](#dataProductDescriptor) as input are able to build, deploy and operate a [data product container](#dataProductContainer).


### Infrastructure Utility Plane

It's the platform plane that have the responsability to provide the services to access the underlying infrastructural resources. The interface of the services exposed by the infrastructure utility plane should be standardized as much as possible in order to decouple their consumers (i.e. the services of the [data product experience plane](#dataProductExperiencePlane) from the actual implementation. Thanks to this decoupling it is possible to:

1. Keep other platform planes indipendent from the underlying technology and so making them reusable in different technological environments
1. Design the standard API of the services exposed by the infrastructure utility plane hiding all the uneccessary uderlying tecnological complexity
1. change the implementation of the services exposed by the infrastructure utility plane without impacting the other planes

### Data Mesh Experience Plane
It's the platform plane that have the responsability to provide the services to search, evaluate and query available data products.

## Data Product Container

It's the boudle of all resources provisioned, deployed and operated in a specific runtime environment (ex. dev, qa, prod) associated to a specific [data product](#dataProduct). It can be viewed as a running instance of the [data product](#dataProduct) described by the [data product descriptor](#dataProductDescriptor). 

For each descriptor multiple container insatnces can exist, usualy there could be one active instance for each runtime environments and data product's major version. In other word cannot exist multiple instance associated to a major version of a [data product](#dataProduct) running in the same environment. It is possible anyway to have different version of the same [data product](#dataProduct) running together in the same environment. 

It's a responsability of the underlyng DataMeshOps platform to interpret the [data product descriptor](#dataProductDescriptor) and properly deploy and operate the related data product containers. The DPDS is designed to guarantee that all required information needed to deploy a data product container are available in the [data product descriptor](#dataProductDescriptor). It's not in the scope of the specification to define how the DataMeshOps platform should deploy and manage data product containers.