# Change the type of externalDocs attribute to an array of External Resource Object

Champion: @andrea-gioia 

Issue: [#65](https://github.com/opendatamesh-initiative/odm-specification-dpdescriptor/issues/65)

## Summary

Change the type of `externalDocs` attribute from [External Resource Object](https://github.com/opendatamesh-initiative/odm-specification-dpdescriptor/blob/v1.0.0-dev/versions/1.0.0-DRAFT.md#externalResourceObject) to [[External Resource Object](https://github.com/opendatamesh-initiative/odm-specification-dpdescriptor/blob/v1.0.0-dev/versions/1.0.0-DRAFT.md#externalResourceObject)]


## Motivation

We propose this change to enable the possibility of adding multiple links to external documentation for each product component that supports the externalDocs attribute. Defining the type of `externalDocs` property as an array is also better aligned with its plural name.

## Design and examples

**as-is**
Field Name | Type | Description
---|:---:|---
<a name="dpdsX"></a>...|... |...
<a name="dpdsExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

**to-be**
Field Name | Type | Description
---|:---:|---
<a name="dpdsX"></a>...|... |...
<a name="dpdsExternalDocumentation"></a>externalDocs | [[External Resource Object](#externalResourceObject)] | Additional external documentation.

**example**
```json
"externalDocs":[
   {
      "description": "Find more info here...",
      "mediaType": "text/html",
      "$href": "https://example1.com"
   }, {
      "description": "... and  here",
      "mediaType": "text/html",
      "$href": "https://example2.com"
}]
```


## Alternatives

There are no valid alternatives

## Decision

The TSC decieded to adopt this change

## Consequences

All components that use the externalDocs attribute MUST be updated properly

## References

No references available
