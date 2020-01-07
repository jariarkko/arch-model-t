# Areas requiring more study {#studysect}

In addition to the guidelines in ({{guidelinessect}}), we suggest there may be value in further
study on the topics balow, with the goal of producing guidelines as
presented in ({{guidelinessect}}).

1. Isolation:
Sophisticated users can sometimes deal with adversarial behaviours in
applications by using different instances of those applications, for example,
differently configured web browsers for use in different contexts.
Applications (including web browsers) and operating systems are also building
in isolation via use of different processes or sandboxing.  Protocol artefacts
that relate to uses of such isolation mechanisms might be worth considering.
To an extent, the IETF has in practice already recognised some of these issues
as being in-scope, e.g.  when considering the linkability issues with
mechanisms such as TLS session tickets, or QUIC connection identifiers.

1. Transparency:
Certificate transparency (CT) {{RFC6962}} has been an effective countermeasure
for X.509 certificate mis-issuance, which used be a known application layer
misbehaviour in the public web PKI.  CT can also help with post-facto detection
of some infrastructure attacks where BGP or DNS weakenesses have been leveraged
so that some certification authority is tricked into issuing a certificate for
the wrong entity.
While the context in which CT operates is very constrained (essentially to the
public CAs trusted by web browsers), similar approaches could perhaps be useful
for other protocols or technologies.
In addition, legislative requirements such as those imposed by the GDPR
{{GDPRAccess}} could lead to a desire to handle internal data structures and
databases in ways that are reminiscent of CT, though clearly with significant
authorisation being required and without the append-only nature of a CT log.

1. Same-Origin Policy:
The Same-Origin Policy (SOP) {{RFC6454}} perhaps already provides an example of
how going beyond the RFC 3552 threat model can be useful. Arguably, the
existence of the SOP demonstrates that at least web browsers already consider
the 3552 model as being too limited. (Clearly, differentiating between same and
not-same origins implicitly assumes that some origins are not as trustworthy as
others.)

1. Greasing:
The TLS protocol {{RFC8446}} now supports the use of GREASE
{{I-D.ietf-tls-grease}} as a way to mitigate on-path ossification. While this
technique is not likely to prevent any deliberate misbehaviours, it may provide
a proof-of-concept that network protocol mechanisms can have impact in this
space, if we spend the time to try analyse the incentives of the various
parties.

1. Generalise OAuth Threat Model: 
The OAuth threat model {{RFC6819}} provides an extensive list of threats and
security considerations for those implementing and deploying OAuth version 2.0
{{RFC6749}}.  It could be useful to attempt to derive a more abstract threat
model from that RFC that considers threats in more generic multi-party
contexts.  That document is perhaps too detailed to serve as useful generic
guidance but does go beyond the Internet threat model from RFC3552, for example
it says: 

    > two of the three parties involved in the OAuth protocol may
    > collude to mount an attack against the 3rd party.  For example,
    > the client and authorization server may be under control of an
    > attacker and collude to trick a user to gain access to resources.

1. Look again at how well we're securing infrastructure:
Some attacks (e.g. against DNS or routing infrastructure) appear to benefit
from current infrastructure mechanisms not being deployed, e.g. DNSSEC, RPKI.
In the case of DNSSEC, deployment is still minimal despite much time having
elapsed. This suggests a number of different possible avenues for
investigation:

    - For any protocol dependent on infrastructure like DNS or BGP, we ought
      analysse potential outcomes in the event the relevant infrastructure has
been compromised
    - Protocol designers perhaps ought consider post-facto detection compromise
      mechanisms in the event that it is infeasible to mitigate attacks on
infrastructure that is not under local control
    - Despite the sunk costs, it may be worth re-considering infrastructure
      security mechanisms that have not been deployed, and hence are
ineffective.

1. Trusted Computing: Various trusted computing mechanisms allow placing some
   additional trust on a particular endpoint. This can be useful to address
some of the issues in this memo:

   * A network manager of a set of devices may be assured that the devices have
     not been compromised.
   * An outside party may be assured that someone who runs a device employs a
     particular software installation in that device, and that the software
runs in a protected environment.

    IETF work such as TEEP {{I-D.ietf-teep-architecture}}
{{I-D.ietf-teep-protocol}} and RATS {{I-D.ietf-rats-eat}} may be helpful in
providing attestations to other nodes about a particular endpoint, or lifecycle
management of such endpoints.

    One should note, however, that it is often not possible to fully protect
endpoints (see, e.g., {{Kocher2019}} {{Lipp2018}}
{{I-D.taddei-smart-cless-introduction}}
{{I-D.mcfadden-smart-endpoint-taxonomy-for-cless}}). And of course, a trusted
computing may be set up and controlled by a party that itself is not trusted; a
client that contacts a server that the server's owner runs in a trusted
computing setting does not change the fact that the client and the server's
owner may have different interests. As a result, there is a need to prepare for
the possibility that another party in a communication is not entirely trusted.

1. Trust Boundaries:
Traditional forms of communication equipment have morphed into today's
virtualized environments, where new trust boundaries exist, e.g., between
different virtualisation layers. And an application might consider itself
trusted while not entirely trusting the underlying operating system. A browser
application wants to protect itself against Javascript loaded from a website,
while the website considers itself and the Javascript an application that it
wants to protect from the browser.
In general, there are multiple parties even in a single device, with differing
interests, including some that have (or claim to) the interest of the human
user in mind.

1. Develop a BCP for privacy considerations:
It may be time for the IETF to develop a BCP for privacy considerations,
possibly starting from {{RFC6973}}.

1. Re-consider protocol design "lore":
It could be that this discussion demonstrates that it is timely to reconsider
some protocol design "lore" as for example is done in
{{I-D.iab-protocol-maintenance}}. More specifically, protocol extensibility
mechanisms may inadvertently create vectors for abuse-cases, given that
designers cannot fully analyse their impact at the time a new protocol is
defined or standardised. One might conclude that a lack of extensibility could
be a virtue for some new protocols, in contrast to earlier assumptions.  As
pointed out by one commenter though, people can find ways to extend things
regardless, if they feel the need.

1. Consider the user perspective:
{{I-D.nottingham-for-the-users}} argues that, in relevant cases where there are
conflicting requirements, the "IETF considers end users as its highest priority
concern." Doing so seems consistent with the expanded threat model being argued
for here, so may indicate that a BCP in that space could also be useful.

