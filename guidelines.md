
## Checklist for Protocol Designers {#guidelinessect}

The following topics are thought to be generally important for
protocol designers to take into account:

1. Consider first principles in protecting information and systems, rather than
   following a specific pattern such as protecting information in a particular
way or only at a particular protocol layer. It is necessary to
   understand what assets there are, what
components can be compromised, where interests may or may not be aligned, and
what parties have a legitimate role in being a party to a specific information
or a control task.

1. Once you have an asset, do not pass it onto others without serious
   consideration. In other words, minimize information passed to others to
guard against the potential compromise of that party.  As recommended in
{{RFC6973}} data minimisation and additional encryption can be helpful - if
applications don't ever see data, or a cleartext form of data, then they should
have a harder time misbehaving. Similarly, not defining new long-term
identifiers, and not exposing existing ones, help in minimising risk.

1. Consider avoiding centralized resources. While centralized components,
   resources, and functions are often simplest deployment models, there can be issues
   associated with them, for example meta-data leakage.
  Consider also how you depend on infrastructure, such as DNS or BGP,
   and analyse potential
outcomes in the event that the relevant infrastructure has been
   compromised (see, e.g.,  {{DeepDive}}).
Similarly, minimize passing
   of control functions to others. Designers should balance
the benefits of centralized resources or control points against the threats
arising.  If it is not possible to avoid, find a way to allow the centralized
resources to be selectable, depending on context and user settings.
As {{RFC3935}} says: " We embrace technical concepts such as decentralized control,
edge-user empowerment and sharing of resources, because those
concepts resonate with the core values of the IETF community."

1. Consider treating parties with which your protocol endpoints interact with suspicion,
even if the communications are encrypted. Other endpoints may misuse any
information or control opportunity in the communication. Similarly, even
endpoints within your own system need to be treated with suspicion, as some
may become compromised.
   For instance, consider performing end-to-end protection via other
   parties: Information passed via another party who does not
   intrinsically need the information to perform its function should
   be protected end-to-end to its intended recipient. This holds
   equally for sending TCP/IP packets, TLS connections, or
   application-layer interactions. As {{RFC8546}} notes, it is a
   useful design rule to avoid "accidental invariance" (the deployment
   of on-path devices that over-time start to make assumptions about
   protocols). However, it is also a necessary security design rule to
   avoid "accidental disclosure" where information originally thought
   to be benign and untapped over-time becomes a significant
   information leak. This guideline can also be applied for different
   aspects of security, e.g., confidentiality and integrity
   protection, depending on what the specific need for information is
   in the other parties.  Of course, depending on the situation
   end-to-end protection may have key management implications; this may not be possible in all situations.

4. Consider abuse-cases. Protocol developers are typically most interested in a
   few specific use-cases for which they need solutions. Expanding the threat
model to consider adversarial behaviours {{AbuseCases}} calls for significant
attention to be paid to potential abuses of whatever new or re-purposed
technology is being considered. 

1. Consider recovery from compromise or attack during protocol design - all
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
targeting an attack. The same effects may result regardless of how protocol
exchanges can be linked to one another.  Protocol designs that aim to prevent
such linkage may produce have fewer unexpected or unwanted side-effects when
deployed.

1. Consider the nature of modern protocol implementations. Protocol
   endpoints are commonly no longer executed on what used be
   understood as a host system.  {{StackEvo}} The web and Javascript
   model clearly differs from traditional host models, but so do many
   server-side deployments, thanks to virtualisation.  At protocol
   design time assume that all endpoints will be run in virtualised
   environments where co-tenants and (sometimes) hypervisors are
   adversaries, and then analyse such scenarios.

