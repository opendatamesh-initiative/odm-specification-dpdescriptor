# Providing documentation
Besides machine-readable descriptions, a data product descriptor document can also include traditional documentation meant to be read by developers. Automatic documentation generators can then merge both and produce comprehensive, nicely-structured reference guides, for example.

This page shows how to take full advantage of special documentation capabilities in OpenAPI like markdown syntax.

## The documentation fields
Almost every object in the [Data Product Descriptor Specification (DPDS)](../overview/README.md) accepts a description field that can provide additional information for developers, beyond what can be automatically generated from the API descriptions.

For instance, an application component has all the fields required to automate its build, deployment and operations. The description field can complement this information by explaining the purpose of this application, its architecture and the technical stack used to develop it.

```json
{
    "fullyQualifiedName": "urn:dpds:com.company-xyz:dataproducts:tripExecution:1:applications:cdcIngestion",
    "version": "1.0.1",
    "description": "The app that offloads the `Trip` aggregate from  **TMS** using *CDC*",
    "platform": "westeurope.azure:debezium",
    "applicationType":"stream-sourcing",
    "buildInfo": {
        ...
    },
    "deployInfo": {
        ...
    }
}
```

Additionally, some objects, which usually have long descriptions, accept a `summary` field providing a short description. This field can be used by external tools' UX in the page or widget that lists these objects and then they can use the `description` field in the detail page, for example.

## The CommonMark syntax
`description` fields allow rich text formatting by using <a href="https://spec.commonmark.org/0.27/" target="_blank">CommonMark 0.27 :octicons-link-external-24:</a>. This section is a quick summary of the syntax of the most commonly used features.

### Headings

```md
# Level 1
## Level 2
### Level 3
```

### Emphasis

```md
*Emphasis*
**Strong Emphasis**
***Both***
```

### Lists

```md
- Item 1
- Item 2
  - Item 2.1
```

### Code

```md
An inline `code span`.
```

Far more features than listed below are available (including HTML tags), but given that DPDS descriptions are meant to be included inside larger auto-generated documentation or application UX, using more advanced formatting is typically very complicated.

## Summary
This page has shown the features provided by DPDS to aid in the documentation process. More specifically:

- Documentation can be added almost everywhere using a `description` field. Some objects also allow a `summary`.
- Text can use rich formatting using **CommonMark** syntax, quickly summarized in this page.

The [next page]() ...