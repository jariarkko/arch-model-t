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
  I-D.arkko-iab-path-signals-collaboration:
  I-D.thomson-tmi:
  
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
{{lazanski-smart-users-internet}}, and others.

It is important that when it comes to basic Internet infrastructure,
our technology addresses non-communications threats to the extent
possible. It is particularly important to ensure that
non-communications security related threats are properly understood
for any new Internet technology. The sole consideration of
communications security aspects in designing Internet protocols may
lead to accidental or increased impact of security issues
elsewhere. For instance, allowing a participant to unnecessarily
collect or receive information may lead to a similar effect as
described in {{RFC8546}} for protocols: over time, unnecessary
information will get used with all the associated downsides,
regardless of what deployment expectations there were during protocol
design.

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
{{I-D.arkko-iab-path-signals-collaboration}} discusses the same topic,
and extends the RFC 8558 principles with recommendations to ensure
minimum set of parties, minimum information, and consent.

Thomson {{I-D.thomson-tmi}} discusses the role intermediaries in the
Internet architecture, at different layers of the stack. A router is
an intermediary, some parts of DNS infrastructure can be
intermediaries, messaging gateways are intermediaries. Thomson
discusses when intermediaries are an appropriate tool, and presents a
number of principles relating to the use of intermediaries, e.g.,
deliberate selection of protocol participants or limiting the
capabilities or information exposure related to the intermediaries.

# Principles {#principles}

# Acknowledgements {#ack}

The author would like to thank the members of the IAB, and the
participants of IETF SAAG WG, Model-T IAB program, and the 2019 IAB
DEDR workshop that all discussed some aspects of these issues. The
author would like to in particular acknowledge the significant
contributions of Stephen Farrell, Martin Thomson, Mark McFadden, Chris
Wood, Domique Lazanski, Eric Rescorla, Russ Housley, Robin Wilton,
Mirja Kuhlewind, Tommy Pauly, and Christian Huitema in discussions
around this general problem area.

