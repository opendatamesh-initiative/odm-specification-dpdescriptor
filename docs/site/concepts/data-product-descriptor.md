# Data Product Descriptor

It's the document that serves as an entry to all the information about a [data product](./data-product.md), including its fully qualified name, owner, domain, version, [interface components](#interfaceComponents) and [internal components](#internalComponents). It is used to share a complete view of the [data product](./data-product.md) between consumers and the underlying [DataOps Platform](./meshops-platform.md) throughout its lifecycle. The objective of DPDS is to provide a standard to define the structure and content of this document.

![open-data-mesh descriptor components](../images/dpds-components.svg)

### <a name="interfaceComponents"></a>Interface Components
The interfaces are exposed to external agents by a [data product](./data-product.md). These interfaces are grouped by functional role in entities named *ports*. Each port exposes a service or set of correlated services. These are the five types of ports supported by the DPSD:

- **Input port(s):** an input port describes a set of services exposed by a [data product](./data-product.md) to collect its source data and makes it available for further internal transformation. An input port can receive data from one or more upstream sources in a push (i.e. asynchronous subscription) or pop mode (i.e. synchronous query). Each [data product](./data-product.md) may have one or more input ports.
- **Output port(s):** an output port describes a set of services exposed by a [data product](./data-product.md) to share the generated data in a way that can be understood and trusted. Each [data product](./data-product.md) may have one or more output ports.
- **Discovery port(s):** a discovery port describes a set of services exposed by a [data product](./data-product.md) to provide information about its static role in the overall architecture like purpose, structure, location, etc. Each [data product](./data-product.md) may have one or multiple discovery ports.
- **Observability port(s):** an observability port describes a set of services exposed by a [data product](./data-product.md) to provide information about its dynamic behavior in the overall architecture like logs, traces, audit trails, metrics, etc. Each [data product](./data-product.md) may have one or more observability ports.
- **Control port(s):** a control port describes a set of services exposed by a [data product](./data-product.md) to configure local policies or perform highly privileged governance operations. Each [data product](./data-product.md) may have one or more control ports.


### <a name="internalComponents"></a>Internal Components

#### <a name="applicationComponents"></a>Application Components
The components of a [data product](./data-product.md) that implement the services exposed through its ports (i.e. pipelines, microservices, etc..). 

In DPDS an application component is mainly described through parametrized templates that formally define how to build and deploy the specific application component (i.e. *pipeline as code*). In particular, there is one `template` and `configurations` attribute pair that describes the application build pipeline and one that describes the application deployment pipeline. These two pairs of attributes should respectively be passed by the [Data Product Experience Plane](./meshops-platform.md#data-mesh-experience-plane) to the proper implementation of *build service* and deployment service* exposed by the [Infrastructure Utility Plane](./meshops-platform.md#infrastructure-utility-plane). The `template` attributes contain the definition of the pipeline that can be executed to build or deploy the application. The `configuration` attributes contain the parameters that should be passed at execution time to the build or deployment service. The form of template and configuration attributes depends on the target build or deployment service implementation exposed by the [Infrastructure Utility Plane](./meshops-platform.md#infrastructure-utility-plane) and referenced in the descriptor. The DPDS does not enforce any specific format.


#### <a name="infrastructuralComponents"></a>Infrastructural Components
The components of a [data product](/data-product.md) related to the infrastructural resources (i.e. storage, computing, etc..) used to run its application components.

In DPDS an infrastructural component is mainly described through a parametrized template that formally defines how to provision the specific infrastructural component (i.e. infrastructure as code). In particular, there is one `template` attribute that defines how to provision the component and one `configuration` attribute that contains the parameters that should be passed at run time to the *provisioning service* exposed by the [Infrastructure Utility Plane](./meshops-platform.md#infrastructure-utility-plane) and referenced in the descriptor. The form of these attributes depends on the specific implementation of the provisioning service invoked. The DPDS does not enforce it.