# Minimal Descriptor Document

[The previous page](./overview.md) showed the overall syntax and structure of a data product descriptor document. The data product descriptor document structure is long and complex so this page just describes the minimal set of fields it must contain while the following pages give more details about specific objects. 

## Data Product Descriptor Entity
The root object in any data product descriptor document is the [Data Product Descriptor Entity](../resources/specifications/last.md#data-product-descriptor-entity). The [Info Object](../resources/specifications/last.md#info-object) contains tha genarl info related to the data product while the [Interface Components Object](../resources/specifications/last.md#internal-components-object) contains all its public interfaces.

![dpds-info-object](../images/dpds-info-object.svg)

### Fields
Only three fields of the [Data Product Descriptor Entity](../resources/specifications/last.md#data-product-descriptor-entity) are mandatory: `dataProductDescriptor`, `info` and `interfaceComponents.outputPorts`. 

- `dataProductDescriptor` (**string:version**): This indicates the version of the DADS this document is using, e.g. “1.0.0”. Using this field tools can check that the document correctly adheres to the specification.
- `info` ([Info Object](../resources/specifications/last.md#info-object)): This provides general information about the data product (like its description and contact information) but the only mandatory fields are `fullyQualifiedName`, `name`, `version`, `domain` and `owner`.
	- `fullyQualifiedName` (**string:fqn**): This is the unique universal identifier of the data product.  It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}`. It's RECOMMENDED to use as `mesh-namespace` your company's domain name in reverse dot notation (ex. `com.company-xyz`) in order to ensure that the `fullyQualifiedName` is a unique universal idetifier as REQUIRED.
	- `version` (**string:version**): this is the <a href="https://semver.org/spec/v2.0.0.html" target="_blank">semantic version number</a> of the data product (not to be confused with the `dataProductDescriptor` version above).
	- `domain` (**string**): This is the domain to which the data product belongs.
	- `owner` ([Owner Object](../resources/specifications/last.md#owner-object)): This is a collection of information related to the data product's owner. The only mandatory field is the `id` of the owner, usually his or her corporate mail address.
- `interfaceComponents` ([Interface Components Object](../resources/specifications/last.md#interfaceComponentsObject)): This is a collection of all ports exposed by the data product (i.e. input, output, etc). The only mandatory field is `outputPorts` which contains the list of all output ports of the data product.
	- `outputPorts` (**array of** [Output Port Component](../resources/specifications/last.md#outputPortComponent)): These are the output ports exposed by the data product.

### Example
The following example shows a minimal data product descriptor document:

```json
{
	"dataProductDescriptor": "1.0.0",
	"info": {
		"fullyQualifiedName": "urn:dpds:com.company-xyz:dataproducts:tripExecution:1",
		"version": "1.2.3",
		"domain": "Transport Management",
		"owner": {
			"id": "john.doe@company-xyz.com",
			"name": "John Doe"
		}
	},
	"interfaceComponents": {
			"outputPorts": []
		}
}
```

This data product is not very useful because it defines no output ports (it does not expose any data). [The next page](./interface.md) remedies that.

## Summary
This page has shown that:

- Every data product descriptor document must contain a root object with at least the fields `dataProductDescriptor`, `info` and `interfaceComponents.outputPorts`.

[The next page](./info.md) describes the contents of the `interfaceComponents` field so ports can be added to the above minimal snippet.