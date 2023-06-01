# Data Product

It's the smallest unit that can be independently deployed and managed in a data architecture (i.e. architectural quantum). It is composed of all the structural components that it requires to do its function: the metadata, the data, the code, the policies that govern the data and its dependencies on infrastructure. Each data product has a clear identifier, a version number and an owner. 

Aside from general information, a data product is composed of external interfaces (i.e. [interface components](./data-product-descriptor.md#interface-components)) and internal resources (i.e. [internal components](./data-product-descriptor.md#internal-components)). [Interface components](./data-product-descriptor.md#interface-components) are *public* and are used by external agents to access services exposed by the data product. [Internal components](./data-product-descriptor.md#internal-components) are *private* and are used by the underlying [DataOps Platform](./meshops-platform.md) to deploy and operate the [data product container](./meshops-platform.md#data-product-container).

The data product's general information, [interface components](./data-product-descriptor.md#interface-components) and [internal components](./data-product-descriptor.md#internal-components) are all described in the [data product descriptor](./data-product-descriptor.md) document whose structure and content are defined by the [Data Product Descriptor Specification (DPDS)](../resources/specifications/README.md).