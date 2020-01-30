
# Guidelines {#guidelinessect}

As {{RFC3935}} says:

> We embrace technical concepts such as decentralized control,
> edge-user empowerment and sharing of resources, because those
> concepts resonate with the core values of the IETF community.

To be more specific, this memo suggests the following guidelines for protocol designers:

1. Consider first principles in protecting information and systems, rather than
   following a specific pattern such as protecting information in a particular
way or only at a particular protocol layer. It is necessary to understand what
components can be compromised, where interests may or may not be aligned, and
what parties have a legitimate role in being a party to a specific information
or a control task.

1. Consider how you depend on infrastructure.  For any protocol directly or
   indirectly dependent on infrastructure like DNS or BGP, analyse potential
outcomes in the event that the relevant infrastructure has been compromised.
Such attacks occur in the wild. {{DeepDive}}

1. Protocol endpoints are commonly no longer executed on what used be
   understood as a host system.  {{StackEvo}} The web and Javascript model
clearly  differs from traditional host models, but so do many server-side
deployments, thanks to virtualisation.  At protocol design time assume
that all endpoints will be run in virtualised environments where co-tenants and
(sometimes) hypervisors are adversaries, and then analyse such scenarios.

1. Once you have something, do not pass it onto others without serious
   consideration. In other words, minimize information passed to others to
guard against the potential compromise of that party.  As recommended in
{{RFC6973}} data minimisation and additional encryption can be helpful - if
applications don't ever see data, or a cleartext form of data, then they should
have a harder time misbehaving. Similarly, not defining new long-term
identifiers, and not exposing existing ones, help in minimising risk.

1. Minimize passing of control functions to others. Any passing of control
functions to other parties should be minimized to guard against the
potential misuse of those control functions. This applies to both technical
(e.g., nodes that assign resources) and process control functions (e.g., the
ability to allocate number or develop extensions). Control functions of all
kinds can become a matter of contention and power struggle, even in cases where
their actual function is minimal, as we saw with the IANA transition debates.

1. Where possible, avoid centralized resources. While centralized components,
   resources, and functions are often simpler, there can be grave issues
associated with them, for example meta-data leakage. Designers should balance
the benefits of centralized resources or control points against the threats
arising.  If it is not possible to avoid, find a way to allow the centralized
resources to be selectable, depending on context and user settings.

1. Treat parties with which your protocol endpoints interact with suspicion,
even if the communications are encrypted. Other endpoints may misuse any
information or control opportunity in the communication. Similarly, even
endpoints within your own system need to be treated with suspicision, as some
may become compromised.

1. Consider abuse-cases. Protocol developers are typically most interested in a
   few specific use-cases for which they need solutions. Expanding the threat
model to consider adversarial behaviours {{AbuseCases}} calls for significant
attention to be paid to potential abuses of whatever new or re-purposed
technology is being considered. 

1. Consider recovery from compromse or attack during protocol design - all
   widely used protocols will at some time be subject to successful attack,
whether that is due to deployment or implementation error, or, less commonly,
due to protocol design flaws.  For example, recent work on multiparty messaging
security primitives {{I-D.ietf-mls-architecture}} considers "post-compromise
security" as an inherent part of the design of that protocol. 

1. Consider linkability. As discussed in {{RFC6973}} the ability to link or
   correlate different protocol messages with one another, or with external
sources of information (e.g. public or private databases) can create privacy or
security issues. As an example, re-use of TLS session tickets can enable an
observer to associate multiple TLS sessions regardless of changes in source or
destination addressing, which may reduce privacy or help a bad actor in
targetting an attack. The same effects may result regardless of how protocol
exchanges can be linked to one another.  Protocol designs that aim to prevent
such linkage may produce have fewer unexpected or unwanted side-effects when
deployed.

But when applying these guidelines, don't take this as blanket reason to
provide no information to anyone, or (impractically) insist on encrypting
everything, or other extreme measures.  Designers need to be aware of the
different threats facing their system, and deal with the most serious ones (of
which there are typically many) within their applicable resource constraints. 

