# Data Product Descriptor

It's the document that serve as an entry to all the information about a [data product](#dataProduct), including its fully qualified name, owner, domain, version, [interface components](#interfaceComponents) and [internal components](#internalComponents). It is used to share a complete view of the [data product](#dataProduct) between consumers and the underlying [DataOps platform](#dataopsPlatform) throughout all its lifecycle. The objective of DPDS is to provide a standard to define the structure and content of this document.

![open-data-mesh descriptor components](../images/dpds-components.svg)

### <a name="interfaceComponents"></a>Interface Components
The interfaces exposed to external agents by a [data product](#dataProduct). These interfaces are grouped by functional role in entities named *port*. Each port exposes a service or set of correlated services. These are the five types of port supported by the DPSD:

- **Input port(s):** an input port describes a set of services exposed by a [data product](#dataProduct) to collect its source data and makes it available for further internal transformation. An input port can receive data from one ore more upstream sources in a push (i.e. asynchronous subscription) or pop mode (i.e. synchronous query). Each [data product](#dataProduct) may have one or more input ports.
- **Output port(s):** an output port describes a set of services exposed by a [data product](#dataProduct) to share the generated data in a way that can be understood and trusted. Each [data product](#dataProduct) may have one or more output ports.
- **Discovery port(s):** a discovery port describes a set of services exposed by a [data product](#dataProduct) to provide information about its static role in the overall architecture like purpose, structure, location, etc.. Each [data product](#dataProduct) may have one or multiple discovery ports.
- **Observability port(s):** an observability port describes a set of services exposed by a [data product](#dataProduct) to provide information about its dynamic behaviour in the overall architecture like logs, traces, audit trails, metrics, etc.. Each [data product](#dataProduct) may have one or more observability ports.
- **Control port(s):** a control port describes a set of services exposed by a [data product](#dataProduct) to configure local policies or perform highly privileged governance operations. Each [data product](#dataProduct) may have one or more control ports.


### <a name="internalComponents"></a>Internal Components

#### <a name="applicationComponents"></a>Application Components
The components of a [data product](#dataProduct) that implement the services exposed through its ports (i.e. pipelines, microservices, etc..). 

In DPDS an application component is mainly described through parametrized templates that formally define how to build and deploy the specific application component (i.e. *pipeline as code*). In partircular there is one `template` and `configurations` attribute pair that describe the application build pipeline and one that describe the application deployment pipeline. These two pairs of attributes should respectvelly be passed by the [Data Product Experience Plane](#dataProductExperiencePlane) to the proper implementation of *build service* and *deploymet service* exposed by the [Infrastructure Utility Plane](#infrastructureUtilityPlane). The `template` attributes contain the definition of the pipeline that can be executed in order to build or deploy the application. The `configurations` attributes contain the parameters that should be passed at execution time to the build or deployment service. The form of template and configuration attributes depends on the target build or deployment service implementation exposed by the [Infrastructure Utility Plane](#infrastructureUtilityPlane) and referenced in the descriptor. The DPDS does not enforce any specific format.


#### <a name="infrastructuralComponents"></a>Infrastructural Components
The components of a [data product](#dataProduct) related to the infrastructural resources (i.e. storage, compute, etc..) used to run its application components.

In DPDS an infrastructural component is mainly described through a parametrized template that formally define how to provision the specific infrastructural component (i.e. infrastructure as code). In partircular there is one `template` attribute that define how to provision the component and one `configurations` attribute that contains the parameters that should be passed at run time to the *provision service* exposed by the [Infrastructure Utility Plane](#infrastructureUtilityPlane) and referenced in the descriptor. The form of these attributes depends on the specific implementation of the provision service invoked. The DPDS does not enforce it.