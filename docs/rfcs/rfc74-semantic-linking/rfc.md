# RFC-74 : Semantic Linking

Champion:  @andrea-gioia 

## Summary

A semantic link is an explicit connection between a data asset exposed by a data product through one of its output ports and one or more concepts defined in a central enterprise ontology.

## Motivation

Semantic linking is a way to bring semantics to a data product and improve its capability to be discovered, reused, and composed with other data products belonging to different domains.

## Design and examples

```json
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "title": "Simplified Movie Object (Compact)",
    "type": "object",

    "s-context": {
        "s-base": "https://schema.org",
        
        "s-type": "[Movie]",

        "movieId": null,
        "directorName": "director[Person].name",
        "directorCountryName": "director[Person].country[Country].name",
        "actors": "actor[Person].name",
        "copyright": {
            "s-type": "copyrightHolder[Organization]",
            "organizationId": null,
            "email": "contactPoint[ContactPoint].mail"
        }  
    },

  
    "properties": {
      "movieId": {
        "type": "string"
      },
      "name": {
        "type": "string"
      },
      "directorName": {
        "type": "string"
      },
      "directorCountryName": {
        "type": "string"
      },
      "actors": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "minItems": 1
      },
      "copyright": {  
        "type": "object",
        "properties": {
            "organizationId": {
                "type": "string"
            },
            "legalName": {
                "type": "string"
            },
            "email": {
                "type": "string"
            }
        }
      }
    }
  }
```
**Explanation:** 
- `s-context`:  defines the semantic links. It can be defined inline or as an external reference 
- `s-base`: the base URL used to resolve concept names
- `s-type`: the linked concept name or full concept URI enclosed in square brackets. The name before the brackets is the name of the parent property valorized by the linked concept. For example  `"copyright": {"s-type": "copyrightHolder[Organization]"}` maps the property `copyright` of the schema to the property `copyrightHolder` of the parent concept (`Movie`) and has as value an `Organization` concept. If the name used in the schema is already equal to the name of the referenced concept property it can be omitted in the mapping.
- ` "movieId": null,` the schema property `movieId` is not defined in the `Movie` concept. It exists only in the physical data
- ` "directorName": "director[Person].name"` : the property `directorName` in the schema is linked to the property `name` of the `Person` who directs the `Movie`
- ` "directorCountryName": "director[Person].country[Country].name"` :  the property `directorCountryName` in the schema is linked to the property `name` of the `Country` of the `Person` who directs the `Movie`
- ` actors": "actor[Person].name` : the property `actors` in the schema is linked to the property `name` of the `Person` who acts in the `Movie`. Because `actors` in the schema is an array the values are the names of the actors.

## Alternatives

The alternative to use [REST API Linked Data Keywords](https://datatracker.ietf.org/doc/draft-polli-restapi-ld-keywords/) has been rejected because is not possible to manage easily semantic linking in flat schemas

## Decision

- Define semantic links using a custom sub-specification
- Define semantic links as a particular type schema annotations

## Consequences

- We need to create a new specification
- We need to work on this RFC together with the RFC related to schema annotation

## References

- [Discussion Thread](https://github.com/opendatamesh-initiative/odm-specification-dpdescriptor/discussions/32)
- RFC Document (not available yet)
