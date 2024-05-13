# DPDS Guiding Principles

DPDS's evolution is guided by a few principles. Suggested contributions should use these principles to guide the details of an RFC and decisions to move forward.


* **Simplicity and consistency over expressiveness and terseness**

  "Possible but awkward" is often favored over more complex
  alternatives. Simplicity (e.g. fewer concepts) is more important than
  expressing more sophisticated ideas or writing less.

* **Preserve option value**

  It's hard to know what the future brings; whenever possible, decisions should
  be made that allow for more options in the future. Sometimes this is
  unintuitive: spec rules often begin more strict than necessary with a future
  option to loosen when motivated by a real use case.

* **Understandability is just as important as correctness**

  The DPDS spec, despite describing technical behavior, is intended to be
  read by people. Use natural tone and include motivation and examples.


* **Integrates seamlessly with other specifications**

  Whenever possible, leverage existing external specifications to avoid reinventing the wheel. The decision to define a new part of the specification from the ground up shouldn't be taken lightly.  

* **Simplify adoption through flexibility**
  Every decision should prioritize adoption by the data community and the supporting ecosystem of tools. Each part of the specification should be independent, optional, and extensible.

  ## References
These principles were adapted from the ones guiding the evolution of the [GraphQL](https://github.com/graphql/graphql-spec/blob/main/CONTRIBUTING.md) standard.