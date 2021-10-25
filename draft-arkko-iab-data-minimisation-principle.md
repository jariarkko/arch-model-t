---
title: "Data minimisation"
abbrev: Data Minimisation in Internet Architecture
docname: draft-arkko-iab-data-minimisation-principle
date: October 2021
category: info

ipr: trust200902
keyword: Internet-Draft

stand_alone: yes
pi: [toc, sortrefs, symrefs]

author:
  -
    ins: J. Arkko
    name: Jari Arkko
    org: Ericsson
    street: Valitie 1B
    city: Kauniainen
    country: Finland
    email: jari.arkko@piuha.net

normative:


informative:
  RFC3552: 
  RFC7258: 
  RFC7858:
  RFC8546:
  RFC8484:
  RFC8558:
  RFC8980:
  RFC9000: 
  I-D.farrell-etm:
  I-D.arkko-arch-internet-threat-model-guidance:
  I-D.lazanski-smart-users-internet:
  I-D.arkko-iab-path-signals-collaboration:
  I-D.thomson-tmi:
  I-D.iab-use-it-or-lose-it:
  I-D.wood-pearg-website-fingerprinting:
  WP2021:
   title: "There’s no escape from Facebook, even if you don’t use it"
   date: August 2021
   author:
     - ins: Geoffrey A. Fowler
   seriesinfo: "Washington Post"
  Fingerprinting:
    title: "Browser Fingerprinting: A survey"
    author:
     - ins: P. Laperdrix
     - ins: N. Bielova
     - ins: B. Baudry
     - ins: G. Avoine
    seriesinfo: "arXiv:1905.01051v2 [cs.CR] 4 Nov 2019"
  AmIUnique:
    title: "Am I Unique?"
    date: 2020
    author:
    - ins: INRIA
    seriesinfo: "https://amiunique.org"
  
--- abstract

Communications security has been at the center of many security
improvements in the Internet. The goal has been to ensure that
communications are protected against outside observers and
attackers. This memo suggests that this is no longer alone sufficient
to cater for the security and privacy issues seen on the Internet
today. For instance, it is often also necessary to protect against
endpoints that are compromised, malicious, or whose interests simply
do not align with the interests of users. While such protection is
difficult, there are some measures that can be taken. It is
particularly important that new technology and new deployments
consider the role of data passed to various parties -- including the
primary protocol participants -- and balance the information given to
them in light of their roles and possible compromise of the
information.

--- middle

# Introduction {#introduction}

Communications security has been at the center of many security
improvements in the Internet. The goal has been to ensure that
communications are protected against outside observers and
attackers.

This has been exemplified in many aspects of IETF efforts, in the
threat models {{RFC3552}}, concerns about surveillance {{RFC7258}},
and the introduction of encryption in many protocols {{RFC9000}},
{{RFC7858}}, {{RFC8484}}.

This memo suggests that current security and privacy issues on the
Internet require even further action. For instance, it is often also
necessary to protect against endpoints that are compromised,
malicious, or whose interests simply do not align with the interests
of users.

While such protection is difficult, there are some measures that can
be taken. It is particularly important that new technology and new
deployments consider the role of data passed to various parties --
including the primary protocol participants -- and balance the
information given to them in light of their roles and possible
compromise of the information.


# Background {#background}

The primary reason for having to go beyond communications security is
success. Advances in protecting most of our communications with strong
cryptographic has resulted in much improved security, but also
highlight the need for addressing other, remaining
issues. Particularly when adversaries have increased their pressure
against other avenues of attack. New adversaries and risks have
arisen, e.g., due to availability of large centralized information
sources, or with the endpoints whose interests are not aligned with
their peers or users.

In short, attacks are migrating towards the currently easier targets,
which no longer necessarily include direct attacks on traffic
flows. These have been discussed at length in, for instance, {{RFC8980}},
{{I-D.farrell-etm}} {{I-D.arkko-arch-internet-threat-model-guidance}},
{{I-D.lazanski-smart-users-internet}}, and others.

It is important that when it comes to basic Internet infrastructure,
our technology addresses non-communications threats to the extent
possible. It is particularly important to ensure that
non-communications security related threats are properly understood
for any new Internet technology.

The sole consideration of communications security aspects in designing
Internet protocols may lead to accidental or increased impact of
security issues elsewhere. For instance, allowing a participant to
unnecessarily collect or receive information may lead to a similar
effect as described in {{RFC8546}} for protocols: over time,
unnecessary information will get used with all the associated
downsides, regardless of what deployment expectations there were
during protocol design.

# Related work {#related}

Hardie {{RFC8558}} discusses path signals, i.e., messages to or from
on-path elements to endpoints. In the past, path signals were often
implicit, e.g., network nodes interpreting in a particular way
transport protocol headers originally intended for end-to-end
consumpion.  The document recommends a principle that implicit signals
should be avoided and that explicit signals be used instead, and only
when the signal's originator intends that it be used by the network
elements on the path.

Arkko, Kuhlewind, Pauly, and Hardie
{{I-D.arkko-iab-path-signals-collaboration}} discuss the same topic,
and extend the RFC 8558 principles with recommendations to ensure
minimum set of parties, minimum information, and consent.

Thomson {{I-D.thomson-tmi}} discusses the role intermediaries in the
Internet architecture, at different layers of the stack. A router is
an intermediary, some parts of DNS infrastructure can be
intermediaries, messaging gateways are intermediaries. Thomson
discusses when intermediaries are an appropriate tool, and presents a
number of principles relating to the use of intermediaries, e.g.,
deliberate selection of protocol participants or limiting the
capabilities or information exposure related to the intermediaries.

Trammel and Kuehlewind {{RFC8546}} discuss the concept of a "wire
image" of a protocol.  This is an abstraction of the information
available to an on-path non-participant in a networking protocol. It
relates to the topic non-participants interpreting information that is
available to them in the "wire image" (or associated timing and other
indirect information). The issues are largely the same even for
participants, that may start to use information available to them,
regardless of whether it was actually intended to that participant or
simply relayed through them.
   
# Principles {#principles}

This memo approaches the topic from the point of disclosing
information to another participant in a protocol exchange.

## Scope of protocol exchanges

This memo does not limit what types of protocol exchanges can lead to information disclosure. The protocol exchanges may relate to:

* The interaction of an endpoint with the network, e.g., information
  they provide in any network attachment process or the wire images of
  the packets sent via the network.

* The interaction of an endpoint with intermediaries, in the meaning
  discussed by Thomson.

* The interaction of an endpoint with a service, such as a website or
  social networking function.

* End-to-end interactions between users, represented by applications
  running on their computers.

It is also important to observe that information disclosure can appear in
several ways:

* Explicitly carried information, e.g., a data item in a message sent
  to a protocol participant. The carried information may also appear
  at multiple layers in the protocol stack, e.g., lower layer
  information, such as topological network addresses can also be
  collected and used by the protocol participant at the end.

* Indirectly inferred information, such as message arrival times or
  patterns in the traffic flow. Information may also be obtained from
  fingerprinting

* Information gathered from a collaboration or collusion among several
  parties, e.g., websites and social media systems collaborating to
  identify visiting users {{WP2021}}.

## Principle: Transmission is publication

PRINCIPLE: Consider information passed to another party as a
publication. Avoid passing information that should not be published.

This principle applies even if the communications that carry that
information are encrypted, as the party that received the
communications and can decrypt them may use the information,
e.g., because it has become or will later become compromised

## Principle: Build for eventual compromise

PRINCIPLE: Build defences to protect information, even when some
component in a system is compromised.

For instance, at the service side encryption of data at rest or in use
may assist in protecting information when an attacker gainst access to
the servers. Similarly, regular purging of old information can limit
damage in case a compromise occurs.

Protocols can ensure that perfect forward secrecy can be provided, so
that the damage resulting from a compromise of keying material has
limited impact.

On the client side, a the client may trust that another party handles
information appropriately, but take steps to ensure or verify that
this is actually the case. For instance, as discussed above, the
client can encrypt a message only to the actual final recipient, even
if the server holds our message before it is delivered. In some case
the client may also verify correct behaviour, e.g., through
confidential computing attestations.

## Principle: Data and recipient minimisation

PRINCIPLE: Information should not be disclosed, stored, or routed in
cleartext through services that do not absolutely need to have that
information for the function they perform.

This the "need to know" principle. Note that this principle applies at
multiple layers in the stack. It is not just about intermediaries in
the network and transport layers, but also intermediaries and services
on the application layer.

Information should  only be passed between the "real ends" of a
conversation, unless the information is necessary for a useful
function in a service.

For instance, a transport connection between two components of a
system is not an end-to-end connection even if it encompasses all the
protocol layers up to the application layer. It is not end-to-end, if
the information or control function it carries actually extends beyond
those components. For instance, just because an e-mail server can read
the contents of an e-mail message does not make it a legitimate
recipient of the e-mail.

### Fingerprinting avoidance

Fingerprinting warrants a separate discussions. Internet technology
tends to move towards richer and more power mechanisms over time. For
instance, full-functionality web and transport layer security stacks are now
used for almost all purposes across the network.

This is of course good, and the performance, expressive power, and
security improvements that came through these are much needed.

Nevertheless, all protocol mechanisms come with some fingerprinting
opportunities, and this tends to be easier the higher in the stack we
are, given the wealth of options and algorithms in
use. {{Fingerprinting}} and {{AmIUnique}} provide a good starting
point for some of the technology and measurements.

The general topic of ensuring a protocol mechanisms stays evolvable
and workable is discussed in {{I-D.iab-use-it-or-lose-it}}, but the
associated methods for reducing fingerprinting possibilities probably
deserve further study {{I-D.wood-pearg-website-fingerprinting}}.

# Acknowledgements {#ack}

The author would like to thank the members of the IAB, and the
participants of IETF SAAG WG, Model-T IAB program, and the 2019 IAB
DEDR workshop that all discussed some aspects of these issues. The
author would like to in particular acknowledge the significant
contributions of Stephen Farrell, Martin Thomson, Mark McFadden, Chris
Wood, Domique Lazanski, Eric Rescorla, Russ Housley, Robin Wilton,
Mirja Kuehlewind, Tommy Pauly, and Christian Huitema in discussions
around this general problem area.

