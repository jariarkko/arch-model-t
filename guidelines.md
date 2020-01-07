# Guidelines {#guidelinessect}

As {{RFC3935}} says:

> We embrace technical concepts such as decentralized control,
> edge-user empowerment and sharing of resources, because those
> concepts resonate with the core values of the IETF community.

To be more specific, this memo suggests the following guidelines for protocol designers:

1. Consider first principles in protecting information and systems, rather than
   following a specific pattern such as protecting information in a particular
way or at a particular protocol layer. It is necessary to understand what
components can be compromised, where interests may or may not be aligned, and
what parties have a legitimate role in being a party to a specific information
or a control task.

1. Once you have something, do not pass it onto others without serious
   consideration: In other words, minimize information passed to others.
Information passed to another party in a protocol exchange should be minimized
to guard against the potential compromise of that party.
As recommended in {{RFC6973}} data minimisation and additional encryption are
likely to be helpful - if applications don't ever see data, or a cleartext form
of data, then they should have a harder time misbehaving. Similarly, not adding
new long-term identifiers, and not exposing existing ones, would seem helpful.

1. Perform end-to-end protection via other parties: Information passed via
   another party who does not intrinsically need the information to perform its
function should be protected end-to-end to its intended recipient. This
guideline is general, and holds equally for sending TCP/IP packets, TLS
connections, or application-layer interactions. As {{RFC8546}} notes, it is a
useful design rule to avoid "accidental invariance" (the deployment of on-path
devices that over-time start to make assumptions about protocols). However, it
is also a necessary security design rule to avoid "accidental disclosure" where
information originally thought to be benign and untapped over-time becomes a
significant information leak. This guideline can also be applied for different
aspects of security, e.g., confidentiality and integrity protection, depending
on what the specific need for information is in the other parties.

1. Minimize passing of control functions to others: Any passing of control
   functions to other parties should be minimized to guard against the
potential misuse of those control functions. This applies to both technical
(e.g., nodes that assign resources) and process control functions (e.g., the
ability to allocate number or develop extensions). Control functions can also
become a matter of contest and power struggle, even in cases where their
function as such is minimal, as we saw with the IANA transition debates.

1. Avoid centralized resources: While centralized components, resources, and
   function provide usually a useful function, there are grave issues
associated with them. Protocol and network design should balance the benefits
of centralized resources or control points against the threats arising from
them. The general guideline is to avoid such centralized resources when
possible. And if it is not possible, find a way to allow the centralized
resources to be selectable, depending on context and user settings.

1. Look at how we're depending on infrastructure.
For any protocol dependent on infrastructure like DNS or BGP, we ought
  analyse potential outcomes in the event the relevant infrastructure has been
compromised

1. Have explicit agreements: When users and their devices provide information
   to network entities, it would be beneficial to have an opportunity for the
users to state their requirements regarding the use of the information provided
in this way. While the actual use of such requirements and the willingness of
network entities to agree to them remains to be seen, at the moment even the
technical means of doing this are limited. For instance, it would be beneficial
to be able to embed usage requirements within popular data formats.

1. Treat parties that your equipment connects to with suspicion, even if the
   communications are encrypted. The other endpoint may misuse any information
or control opportunity in the communication. Similarly, even parties within
your own system need to be treated with suspicision, as some nodes may become
compromised.

1. Protocol developers and those implementing and deploying Internet technologies
are typically most interested in a few specific use-cases for which they need
solutions. Expanding our threat model to include adversarial application
behaviours {{AbuseCases}} seems likely to call for significant attention to be
paid to potential abuses of whatever new or re-purposed technology is being
considered. 

1. Consider recovery from attack as part of protocol design.
Recent work on multiparty messaging security primitives
{{I-D.ietf-mls-architecture}} considers "post-compromise security" as an
inherent part of the design of that protocol. Perhaps protocol designers ought
generally consider recovery from attack during protocol design - we do know
that all widely used protocols will at sometime be subject to successful
attack, whether that is due to deployment or implementation error, or, as is
less common, due to protocol design flaws.

1. More and more, protocol endpoints are not being executed on what used be
understood as a host system. The web and Javascript model clearly  differs from
traditional host models, but so do most server-side deployments these days,
thanks to virtualisation.
Protocol endpoints can no longer be
considered to be executing on a traditional host, so assume (at protocol design
time) that all endpoints will be run in a virtualised environment where
co-tenants and (sometimes) hypervisors are adversaries, and then 
analyse such scenarios.
As yet unpublished work on this topic within the IAB {{StackEvo}} programme,
appears to posit the same kind of thesis. 

1. Do not take any of this as blanket reason to provide no information to
   anyone, encrypt everything to everyone, or other extreme measures. However,
the designers of a system need to be aware of the different threats facing
their system, and deal with the most serious ones (of which there are typically
many). Similarly, users should be aware of the choices made in a particular
design, and avoid designs or products that protect against some threats but are
wide open to other serious issues.


