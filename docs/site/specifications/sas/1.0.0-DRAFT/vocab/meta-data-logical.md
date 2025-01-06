# <a name="vocab-meta-data-logical"></a>Logical Meta-Data Annotations Vacabulary

The Logical Meta-Data Annotations Vacabulary, defined as an extension of the SAS, provides commonly used metadata for annotating schemas at a logical level. The keywords in this vocabulary do not include, and will not include in the future, any information about the underlying datastore or details for schema or data validation.

The current URI for this vocabulary, known as the Logical Meta-Data Annotations Vacabulary, is: [<https://dpds.opendatamesh.org/specifications/sas/1.0.0-DRAFT/vocab/meta-data-logical>](https://dpds.opendatamesh.org/specifications/sas/1.0.0-DRAFT/vocab/meta-data-logical).

The current URI for the corresponding meta-schema is: [https://dpds.opendatamesh.org/specifications/sas/1.0.0/meta/meta-data-logical](https://dpds.opendatamesh.org/specifications/sas/1.0.0/meta/meta-data-logical).


## <a name="vocab-meta-data-logical-element-kws"></a>Keywords applicable to schema or properties

<!-- summary -->
####  <a name="vocab-meta-data-logical-kw-summary"></a>summary
The value of this keyword MUST be a `string`.

The `summary` keyword specifies a short human readable description of the element. It SHOULD be used by frontend tools to visualize the item description in lists or tooltips where there is not enough space for using the full description.

*Example-1:*

```json
{
  "title": "Leg",
  "summary": "The association between Trasport Units and Trips",
  "description": "A **Leg** is the association between a `Transport Unit` and a specific `Trip`. It represents how individual `Transport Units` are moved during a particular segment of their journey. Multiple  `Leg` can exist for a `Transport Unit` if it is moved across different `Trips` before reaching its final destination. Similarly, a single `Trip` can involve `Transport Units` from multiple `Transport Orders`.",
}
```

<!-- modelRole -->
###  <a name="vocab-meta-data-logical-kw-modellingStyle"></a>modelRole
The value of this keyword MUST be a `string`

The `modellingStyle` keyword specifies the role of a schema element within its specific modelling style, helping to clarify its function in the context of the chosen model. For example, if the `modellingStyle` is set to `starSchema`, the schema might define an entity with a `modelRole` of either `fact` or `dimension`. In this case, the properties of the schema can have a `modelRole` of either `attribute` or `measure`. On the other hand, if the `modellingStyle` is set to `rawDataVault`, the schema might define an entity with a `modelRole` of `hub`, `satellite`, or `link`. This distinction helps clarify the purpose of each element within the overall model.

<!-- tags -->
###  <a name="vocab-meta-data-logical-kw-tags"></a>tags
The value of this keyword MUST be  an `array` of `string`

The `tags` keyword specifies a list of tags associated to the element.

This keyword is equivalent to:
- [`bitol.schema.tags`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)
    
<!-- externalDocs -->
###  <a name="vocab-meta-data-logical-kw-externalDocs"></a>externalDocs
The value of this keyword MUST be  an `array` of `object`

The `externalDocs` keyword specifies a list of additional documentation for the given element. Each item in the list is a pointer to a specific documentation source described as follow:

Field Name | Type | Description
---|:---:|---
<a name="externalResourceDescription"></a>description | `string` | A description of the target resource. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation. 
<a name="externalResourceMediaType"></a>mediaType | `string` | The media type of target resource. It must conform to media type format, according to [RFC6838](https://www.rfc-editor.org/rfc/rfc6838).
<a name="externalResourceHref"></a>$href | `string:uri` | **REQUIRED**. The URI of the target resource. It must conform to the URI format, according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986).

*Example-1:*

```json
"externalDocs": [{
  "description": "Find more info here",
  "mediaType": "text/html",
  "$href": "https://example.com"
}]
```

This keyword can be maped to:
- [`bitol.schema.primaryKey`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)
  
## <a name="vocab-meta-data-property-kws"></a>Keywords applicable only to schema

<!-- owner -->
###  <a name="vocab-meta-data-logical-kw-owner"></a>owner

The value of this keyword MUST be a `string`.

The `owner` keyword specifies the identifier of the subject who owns the schema. It SHOULD be a person or a team. If the schema is not shared, it MUST be equal to the owner of the dataset upon which the schema is defined.

This keyword is equivalent to:
- [`bitol.schema.owner`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)

<!-- domain -->
###  <a name="vocab-meta-data-logical-kw-domain"></a>domain
The value of this keyword MUST be a `string`.

The `domain` keyword specifies the domain to which the dataset described by the schema belongs. If the schema is not shared, it MUST be equal to the domain of the dataset upon which the schema is defined.

This keyword is equivalent to:
- [`bitol.schema.domain`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)

<!-- schemaType -->
###  <a name="vocab-meta-data-logical-kw-schemaType"></a>schemaType
The value of this keyword MUST be a `string`.

The `schemaType` keyword specifies the structure of the data described by the schema. It indicates whether the data is organized in a tabular format, typical of relational databases (e.g., tables with rows and columns), or in a nested document format, common in document-oriented databases, streaing platforms and RESTFUL API (e.g., JSON or XML with hierarchical relationships). The possible values for this property are:

|value|description|
|---|:---:|
|`tabular`|When the schema doesn't contain properties of type object (i.e. the schema describe a tabular document)|
|`document`|When the schema contains properties of type object (i.e. the schema describe a neasted document)|

*Example-1*

```json
{
    "title": "transportOrder",
  "schemaType": "tabular",
    "type": "object",
    "properties": {
      "orderId": {"type": "integer"},
      "customerName": {"type": "string"},
      "orderDate": {"type": "string"},
      "deliveryDate": {"type": "string"},
      "destination": { "type": "string"},
      "orderStatus": {"type": "string" }
    }
  }
```

*Example-2*

```json
{
    "title": "transportOrderDetail",
  "schemaType": "document",
    "type": "object",
    "properties": {
      "orderId": {"type": "integer"},
      "customerName": {"type": "string"},
      "orderDate": {"type": "string"},
      "deliveryDate": {"type": "string"},
      "destination": { "type": "string"},
      "orderStatus": {"type": "string" },
    "transportUnits": {
      "type": "array",
          "description": "List of transport units associated with the transport order.",
          "items": {
            "type": "object",
            "properties": {
                "unitId": {"type": "integer"},
                "unitDescription": {"type": "string"}
            }
        }
      }
  }
}
```

<!-- modellingStyle -->
###  <a name="vocab-meta-data-logical-kw-modellingStyle"></a>modellingStyle
The value of this keyword MUST be a `string`.

The `modellingStyle` keyword specifies the data modelling approach or framework within which the structure of the entity described by this schema is defined. This could include frameworks like `starSchema`, `rawDataVault`, or `unifiedStarSchema`, each with its own set of rules for how data is organized, related, and queried. Understanding the modelling style is useful for better contextualizing the schema's structure and gaining a clearer understanding of the roles and relationships of other elements defined within it (see [`modelRole`](#modelRole) keyword).

<!-- contactPoints -->
###  <a name="vocab-meta-data-logical-kw-contactPoints"></a>contactPoints
The value of this keyword MUST be  an `array` of `object`.

The `contactPoints` keyword specifies a list of contact information for the given schema. Each item in the list is a valid contact point described as follow:

Field Name | Type | Description
---|:---:|---
<a name="contactPointName"></a>name| `string:name` | The name of the contact point.
<a name="contactPointDescription"></a>description | `string` | The contact point description. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="contactPointChannel"></a>channel| `string` | The channel used to address the contact point. It can be for example equal to  `web`, `mail`, or `phone`.
<a name="contactPointAddress"></a>address| `string` | The address of the contact point. Depending on the channel it can be for example a URL, an email address, or a phone number.

*Example-1*

```json
{
  "contactPoints": [{
    "name": "Support Team Mail",
      "description": "The mail address of the team that gives support on this product",
      "channel": "email",
      "address": "trip-execution-support@company-xyz.com"
  }, {
      "name": "Issue Tracker",
      "description": "The address of the issue tracker associated with this product",
      "channel": "web",
      "address": "https://readmine.company-xyz.com/trip-execution"
    }
  ]
}
```

This keyword cona be mapped to:

- [`bitol.support-and-cominucation-channels`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#support-and-communication-channels)


<!-- status -->
###  <a name="vocab-meta-data-logical-kw-status"></a>status
The value of this keyword MUST be a `string`

The `status` keyword specifies the state of the schema, which MAY be `development`, `test`, or `production`, depending on how the schema's lifecycle is defined.


This keyword is equivalent to:

- [`bitol.schema.status`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)


## <a name="vocab-meta-data-logical-properties-kws"></a>Keywords applicable only to properties

<!-- primaryKey -->
###  <a name="vocab-meta-data-logical-kw-primaryKey"></a>primaryKey
The value of this keyword MUST be a `boolean`. 

When set to `true`, the `primaryKey` keyword indicates that the property is part of the dataset's primary key.

The default value is `false`.

This keyword is equivalent to:

-  [`bitol.schema.primaryKey`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)

<!-- primaryKeyPosition -->
###  <a name="vocab-meta-data-logical-kw-primaryKeyPosition"></a>primaryKeyPosition

The value of this keyword MUST be a `integer`. 

When the property is part of the primary key, the `primaryKeyPosition` keyword specifies the position of the property within th  primary key. Starts from 1. 

The default value is `-1`.

*Example-1:*
Given the table `TRIP` with a composite primary key defined as follow `PRIMARY KEY (UNIT_ID, TRIP_ID, LEG_SEQUENCE)` the annotation of the properties in the schema will be as follow:

```json
  {
    "properties": {
      "UNIT_ID": {
        "type": "string",
        "primaryKey": true,
        "primaryKeyPosition": 1
      },
      "TRIP_ID": {
        "type": "string",
        "primaryKey": true,
        "primaryKeyPosition": 2
      },
      "LEG_SEQUENCE": {
        "type": "integer",
        "primaryKey": true,
        "primaryKeyPosition": 3
      }
    }
  }
```

This keyword is equivalent to:
- [`bitol.schema.primaryKeyPosition`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)

<!-- unique -->
###  <a name="vocab-meta-data-logical-kw-unique"></a>unique

The value of this keyword MUST be a `boolean`.

The `unique` keyword specifies whether two distinct entries in the dataset can have the same value for this property.

The default value is `false`.

*Example-1:*

```json
{
  "title": "TransportOrder",
 
 "type": "object",
  "properties": {
    "orderId": { "type": "integer", "unique": true},
    "customerName": { "type": "string"}
  },
}
```

This keyword is equivalent to:
- [`bitol.schema.unique`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)

<!-- nullable -->
###  <a name="vocab-meta-data-logical-kw-nullable"></a>nullable

The value of this keyword MUST be a `boolean`. 

The `nullable` keyword specifies if the property value can be null. The value of a property is considered null if the property is not defined or its value is: 
- undefined
- contained in the list of values specified by the [`nullValues`](#nullValues) keyword
- matched by the regular expression specified by the [`nullValuePattern`](#nullValuePattern) keyword

The default value is `true`.

*Example-1:*

```json
{
  "title": "TransportOrder",
 
 "type": "object",
  "properties": {
    "orderId": { "type": "integer"},
    "customerName": {"type": "string", "nullable": false},
    "orderDate": {"type": "string"},
    "deliveryDate": {"type": "string"},
    "destination": {"type": "string"},
    "orderStatus": {"type": "string"}
  },
}
```

This keyword is the opposite of:
- [`bitol.schema.required`](https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#schema)

<!-- nullValuesEnum -->
###  <a name="vocab-meta-data-logical-kw-nullValuesEnum"></a>nullValuesEnum

The value of this keyword MUST be an `array` whose item type is equal to the type of the property. 

The `nullValuesEnum` keyword specifies a list of values for the property that can be considere as null.

The default value is `[]`.

*Example-1:*

```json
{
  "title": "TransportOrder",
 
 "type": "object",
  "properties": {
    "orderId": { "type": "integer"},
    "customerName": {
        "type": "string", 
        "nullable": false,
        "nullValuesEnum": ["UNKNOWN", "TBD", "NA"]
    }
  },
}
```

<!-- nullValuesPattern -->
###  <a name="vocab-meta-data-logical-kw-nullValuesPattern"></a>nullValuesPattern

The value of this keyword MUST be a `string`. This string SHOULD be a valid regular expression, according to the ECMA-262 regular expression dialect.

The `nullValuesPattern` keyword specifies the regular expression matched by property null values

The default value is ``.

*Example-1:*

```json
{
  "title": "TransportOrder",
 
  "type": "object",
  "properties": {
    "orderId": { "type": "integer"},
    "customerName": {
      "type": "string", 
      "nullable": false,
      "nullValuesPattern": "^\\s*(UNKNOWN|TBD|NA)?\\s*$"
    }
  }
}
```

<!-- validityTime -->
###  <a name="vocab-meta-data-logical-kw-validityTime"></a>validityTime

The value of this keyword MUST be a `boolean`. 

When set to `true`, the `validityTime` keyword indicates that this property value represents when a fact is true in the real world. For example, a dataset's entry showing the employment status of an employee might have a valid time indicating when that employment status was valid in reality. 

The default value is `false`.

<!-- creationTime -->
###  <a name="vocab-meta-data-logical-kw-creationTime"></a>creationTime

The value of this keyword MUST be a `boolean`. 

When set to `true`, the `creationTime` keyword indicates that this property value represents when a fact is recorded in the system. It's the transaction time of the entry's creation. 

The default value is `false`.

<!-- lastUpdateTime -->
###  <a name="vocab-meta-data-logical-kw-lastUpdateTime"></a>lastUpdateTime

The value of this keyword MUST be a `boolean`. 

When set to `true`, the `lastUpdateTime` keyword indicates that this property value represents when a fact is recorded or updated in the system. It's the transaction time of the entry's last update. 

The default value is `false`.

<!-- deletionTime -->
###  <a name="vocab-meta-data-logical-kw-lastUpdateTime"></a>deletionTime

The value of this keyword MUST be a `boolean`. 

When set to `true`, the `deletionTime` keyword indicates that this property value represents when a fact is soft deletaed from the system. It's the transaction time of the entry's delation. 

The default value is `false`.

<!-- sequenceKey -->
###  <a name="vocab-meta-data-logical-kw-sequenceKey"></a>sequenceKey

The value of this keyword MUST be a `boolean`. 

When set to `true`, the `sequenceKey` keyword indicates that this property can be used to order the dataset's entries from the oldest to the most recent, based on creation transaction time. The property is updated with each entry's change and is typically a timestamp or an incremental key.

The default value is `true` if keywords [`creationTime`](creationTime) set to `true` for this property, `false` otherwise.

<!-- watermarkKey -->
###  <a name="vocab-meta-data-logical-kw-watermarkKey"></a>watermarkKey

The value of this keyword MUST be a `boolean`. 

When set to `true`, the `watermarkKey` keyword indicates that this property can be used to order the dataset's entries from the oldest to the most recent, based on the last update transaction time. The property is updated with each entry's change and is typically a timestamp or an incremental key.

The default value is `true` if keywords [`lastUpdateTime`](lastUpdateTime) set to `true` for this property, `false` otherwise.