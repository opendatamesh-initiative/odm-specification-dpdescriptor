# Data Product Descriptor Specification Contribution Guide

This document describes the Data Product Descriptor Specification (DPDS) development processes. 
These processes have been established to provide an open and transparent mechanism for deciding how to evolve DPDS.

When contributing to the DPDS evolution consider the [Code of Conduct](https://github.com/opendatamesh-initiative/.github/blob/main/CODE_OF_CONDUCT.md)
to better understand expected and unacceptable behavior.
While participating in the specification evolution is a valuable contribution, there are also other popular ways to contribute listed [here](CONTRIBUTING.md)

This document will be adjusted as practicality dictate

## Guiding Principles

DPDS's evolution is guided by a few principles. 

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

  Whenever possible, leverage existing external specifications to avoid reinventing the wheel. 
  The decision to define a new part of the specification from the ground up shouldn't be taken lightly.  

* **Simplify adoption through flexibility**

  Every decision should prioritize adoption by the data community and the supporting ecosystem of tools.
  Each part of the specification should be independent, optional, and extensible.

## Editorial Contributions
Editorial contributions do not change the interpretation of the specification but instead
improve legibility, fix editorial errors, clear up ambiguity, and improve
examples 

Editorial changes are welcome as PR and can be merged into the specification by a [Committer](#) without a formal process.

## Specification Contributions
Specification contributions  _do_ meaningfully change the interpretation of the specification. 

Small specification changes are welcome as PR and can be merged into the specification by a [Committer](#) without a formal process.

Bigger specification changes require a more formal process. This type of contribution must follow a formal RFC (Request For Comments) 
process led by a *[champion](#champion-definition)* through a series of *stages* intended to improve *visibility*, 
allow for *discussion* to reach the best solution, and arrive at *consensus*. 
This process becomes even more important as DPDS's community broadens.

### Driving factors

The DPDS should be use-case driven. We can specify support for hypothetical use cases as we see fit, but specifications should be backed by realistic scenarios.

### Change Criteria

The specification *will evolve over time*. Changes  may be made when any of the following criteria are met:

* Clarity. The current "way" something is done doesn't make sense, is complicated, or not clear.

* Consistency. A portion of the specification is not consistent with the rest, or with the industry standard terminology.

* Necessary functionality. We are missing functionality because of a certain design of the specification.

* Forward-looking designs. As usage of APIs evolves to new protocols, formats, and patterns, we should always consider what the next important functionality should be.

* Impact. A change will provide impact on a large number of use cases. We should not be forced to accommodate every use case. We should strive to make the *common* and *important* use cases both well supported and common in the definition of the OAI Spec. We cannot be edge-case driven.

### Change Process

We're open to changes, and these can be proposed by anyone.

Small changes are welcome as pull requests.

Bigger changes require a more formal process.

1. Start a [discussion](https://github.com/OAI/OpenAPI-Specification/discussions) of type     "Brainstorm".  The discussion entry must describe at least the problem it wants to solve and why it matters. At this stage, a description of the possible solution is not required. If there is engagement and support for the proposal over time, then it can be considered as a candidate to move to the next stage.

2. If the suggested change has good support, you will be asked to create a formal RFC.
Use the [template in the proposals directory](https://github.com/OAI/OpenAPI-Specification/tree/main/proposals).

3. The RFC will be more closely reviewed and commented on or amended until it is either rejected or accepted. At that point, the proposal is merged to the appropriate version of the specification.

Questions are welcome on the process and at any time. Use the discussions feature or find us in Slack.


### RFC Champions

Contributing to DPDS requires a lot of dedicated work. To set clear
expectations and provide accountability, each proposed RFC (request for
comments) must have a *champion* who is responsible for addressing feedback and
completing next steps. An RFC may have multiple *champions*. The spec Committers
are not responsible for completing RFCs which lack a *champion* (though a
Committer may be a *champion* for an RFC).

An RFC which does not have a *champion* may not progress through stages, and can
become stale. Stale proposals may be picked up by a new *champion* or may
be *rejected*.

A champion is anyone who leads the work on an RFC. It doesn't
mean it has to be the only person working on it though. They
are a "person of reference" for a given RFC implementation and
may or may not know about JS, relying on the help of other
community members to implement the RFC on the [AsyncAPI JSON Schema](https://github.com/asyncapi/spec-json-schemas).


### RFC Contribution Stages

RFCs are guided by a *champion* through a series of stages: *strawman*,
*proposal*, *draft*, and *accepted* (or *rejected*), each of which has suggested
entrance criteria and next steps detailed below. RFCs typically advance one
stage at a time, but may advance multiple stages at a time. Stage
advancements occur on GitHub.

In general, it's preferable to start with a pull request so that we can best
evaluate the RFC in detail. However, starting with an issue is also permitted if
the full details are not worked out.

All RFCs start as either a *strawman* or *proposal*.

#### Stage 0: *Strawman*

An RFC at the *strawman* stage captures a described problem or
partially-considered solutions. A *strawman* does not need to meet any entrance
criteria. A *strawman's* goal is to prove or disprove a problem and guide
discussion towards either rejection or a preferred solution. A *strawman* may
be an issue or a pull request (though an illustrative pull request is preferrable).

*There is no entrance criteria for a Strawman*

As implied by the name [strawman](https://en.wikipedia.org/wiki/Straw_man_proposal),
the goal at this stage is to knock it down (*reject*) by considering other
possible related solutions, showing that the motivating problem can be solved
with no change to the specification, or that it is not aligned with the
*guiding principles*.

Once determined that the *strawman* is compelling, it should seek the entrance
criteria for *proposal*.


#### Stage 1: *Proposal*

An RFC at the *proposal* stage is a solution to a problem with enough fidelity
to be discussed in detail. It must be backed by a willing *champion*. A
*proposal*'s goal is to make a compelling case for acceptance by describing
both the problem and the solution via examples and spec edits. A *proposal*
should be a pull request.

*Entrance criteria:*

* Identified *champion*
* Clear explanation of problem and solution
* Illustrative examples
* Incomplete spec edits
* Identification of potential concerns, challenges, and drawbacks

A *proposal* is subject to the same discussion as a *strawman*: ensuring that it
is well aligned with the *guiding principles*, is a problem worth solving, and
is the preferred solution to that problem. A *champion* is not expected to have
confidence in every detail at this stage and should instead focus on identifying
and resolving issues and edge-cases. 

Most *proposals* are expected to evolve or change and may be rejected. Therefore,
it is unwise to rely on a *proposal* in a production environment. DPDS-compliant
tools *may* implement *proposals*, though are encouraged to not enable the
*proposed* feature without explicit opt-in.


#### Stage 2: *Draft*

An RFC at the *draft* stage is a fully formed solution. There is
consensus the problem identified should be solved, and this particular solution
is preferred. A *draft's* goal is to precisely and completely describe the
solution and resolve any concerns. A *draft*
must be a pull request.

*Entrance criteria:*

* Consensus the solution is preferred
* Resolution of identified concerns and challenges
* Precisely described with spec edits
* Compliant implementation in [DPDS JSON Schema](https://github.com/asyncapi/spec-json-schemas) (might not be merged)

A *proposal* becomes a *draft* when the set of problems or drawbacks have been
fully considered and accepted or resolved, and the solution is deemed
desirable. A *draft*'s goal is to complete final spec edits that are ready to
be merged.

*Drafts* may continue to evolve and change, occasionally dramatically, and are
not guaranteed to be accepted. Therefore, it is unwise to rely on a *draft* in a
production environment. DPDS-compliant tools *should* implement *drafts* to
provide valuable feedback, though are encouraged not to enable the *draft*
feature without explicit opt-in when possible.


#### Stage 3: *Accepted*

An RFC at the *accepted* stage is a completed solution. According to a spec
Committer it is ready to be merged as-is into the spec document. An *accepted* RFC must be
implemented in the [AsyncAPI JSON Schema](https://github.com/asyncapi/spec-json-schemas).

*Entrance criteria:*

* Consensus the solution is complete
* Complete spec edits, including examples and prose
* Compliant implementation in the [AsyncAPI JS Parser](https://www.github.com/asyncapi/parser-js) and the [AsyncAPI JSON Schema](https://github.com/asyncapi/spec-json-schemas) (fully tested and merged or ready to merge)

A *draft* is *accepted* when the Committers have been convinced that it appropriately handles all edge cases; that the
spec changes not only precisely describe the new syntax and semantics but
include sufficient motivating prose and examples; and that the RFC includes
edits to any other affected areas of the spec. Once *accepted*, its *champion*
should encourage adoption of the RFC by opening issues or pull requests on other
popular DPDS-compliant tools.

An *accepted* RFC is merged into the DPDS's master branch by a Committer
and will be included in the next released revision.


#### Stage X: *Rejected*

An RFC may be *rejected* at any point and for any reason. Most rejections occur
when a *strawman* is proven to be unnecessary, is misaligned with the *guiding
principles*, or fails to meet the entrance criteria to become a *proposal*.
A *proposal* may become *rejected* for similar reasons as well as if it fails to
reach consensus or loses the confidence of its *champion*. Likewise a *draft*
may encounter unforeseen issues during implementations which cause it to lose
consensus or the confidence of its *champion*.

RFCs which have lost a *champion* will not be *rejected* immediately, but may
become *rejected* if they fail to attract a new *champion*.

Once *rejected*, an RFC will typically not be reconsidered. Reconsideration is
possible if a *champion* believes the original reason for rejection no longer
applies due to new circumstances or new evidence.

### Transparency

The process should be as transparent as possible. Sometimes there will be discussions that use customer names, sensitive use cases, and so on. These must be anonymized, discussed in a private repository, or conducted offline. General discussions should happen on the GitHub issues for this project.

### Participation

While governance of the specification is the role of the TSC, the evolution of the specification happens through the participation of members of the developer community at large. Any person willing to contribute to the effort is welcome, and contributions may include filing or participating in issues, creating pull requests, or helping others with such activities.


## References
This document was adapted from the [GraphQL Specification Contribution Guide](https://github.com/graphql/graphql-spec/blob/main/CONTRIBUTING.md).
