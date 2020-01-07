# Introduction {#introduction}
 
Communications security has been at the center of many security improvements in the Internet. The goal has been to ensure that communications are protected against outside observers and attackers. At the IETF, this approach has been formalized in BCP 72 {{RFC3552}}, which defined the Internet threat model in 2003.

The purpose of a threat model is to outline what threats exist in order to assist the protocol designer. But RFC 3552 also ruled some threats to be in scope and of primary interest, and some threats out of scope {{RFC3552}}:

> The Internet environment has a fairly well understood threat model.
> In general, we assume that the end-systems engaging in a protocol
> exchange have not themselves been compromised.  Protecting against an
> attack when one of the end-systems has been compromised is
> extraordinarily difficult.  It is, however, possible to design
> protocols which minimize the extent of the damage done under these
> circumstances.
> 
> By contrast, we assume that the attacker has nearly complete control
> of the communications channel over which the end-systems communicate.
> This means that the attacker can read any PDU (Protocol Data Unit) on
> the network and undetectably remove, change, or inject forged packets
> onto the wire. 

However, the communications-security -only threat model is becoming outdated. This is due to three factors:

* Advances in protecting most of our communications with strong cryptographic means. This has resulted in much improved communications security, but also highlights the need for addressing other, remaining issues. This is not to say that communications security is not important, it still is: improvements are still needed. Not all communications have been protected, and even out of the already protected communications, not all of their aspects have been fully protected. Fortunately, there are ongoing projects working on improvements.

* Adversaries have increased their pressure against other avenues of attack, from compromising devices to legal coercion of centralized endpoints in conversations.

* New adversaries and risks have arisen, e.g., due to creation of large centralized information sources.

* While communications-security does seem to be required to protect privacy,
  more is needed.

In short, attacks are migrating towards the currently easier targets, which no
longer necessarily include direct attacks on traffic flows. In addition,
trading information about users and ability to influence them has become a
common practice for many Internet services, often without users understanding
those practices.

This memo suggests that the existing threat model, while important and still valid, is no longer alone sufficient to cater for the pressing security issues in the Internet. For instance, while it continues to be very important to protect Internet communications against outsiders, it is also necessary to protect systems against endpoints that are compromised, malicious, or whose interests simply do not align with the interests of the users.

Of course, there are many trade-offs in the Internet on who one chooses to interact with and why or how. It is not the role of this memo to dictate those choices. But it is important that we understand the implications of different practices. It is also important that when it comes to basic Internet infrastructure, our chosen technologies lead to minimal exposure with respect to the non-communications threats.

It is particularly important to ensure that non-communications security related threats are properly understood for any new Internet technology. While the consideration of these issues is relatively new in the IETF, this memo provides some initial ideas about potential broader threat models to consider when designing protocols for the Internet or when trying to defend against pervasive monitoring. Further down the road, updated threat models could result in changes in BCP 72 {{RFC3552}} (guidelines for writing security considerations) and BCP 188 {{RFC7258}} (pervasive monitoring), to include proper consideration of non-communications security threats.

It may also be necessary to have dedicated guidance on how systems design and architecture affect security. The sole consideration of communications security aspects in designing Internet protocols may lead to accidental or increased impact of security issues elsewhere. For instance, allowing a participant to unnecessarily collect or receive information may lead to a similar effect as described in {{RFC8546}} for protocols: over time, unnecessary information will get used with all the associated downsides, regardless of what deployment expectations there were during protocol design. 

This memo does not stand alone. To begin with, it is a merge of earlier work by the two authors {{I-D.farrell-etm}} {{I-D.arkko-arch-internet-threat-model}}. There are also other documents discussing this overall space, e.g. {{I-D.lazanski-smart-users-internet}} {{I-D.arkko-arch-dedr-report}}.

The authors of this memo envisage independent development of each of those
(and other work) with an eventual goal to extract an updated (but usefully
brief!) description of an extended threat model from the collection of works.
We consider it an open question whether this memo, or any of the others, would
be usefully published as an RFC.

The rest of this memo is organized as follows. {{situationanalysis}} makes some observations about the situation, with respect to communications security and beyond. The section also provides a number of real-world examples.

{{analysis}} discusses some high-level implications that can be drawn, such as the need to consider what the "ends" really are in an "end-to-end" communication.

{{guidelinessect}} discusses some potential remedies, both from the point of view of a system design, as well as from the point of IETF procedures and recommended analysis procedures when designing new protocols. For instance, {{guidelinessect}} will also discuss high-level guidance to addressing these threats, and {{changes3552}} suggests some potential changes to the definition of the IETF's "Internet Threat Model". It is also apparent that the dangers posed by pervasive monitoring need to be taken in a broader light, given the evolution of the threats beyond communications security.

Comments are solicited on these and other aspects of this document. The best place for discussion is on the arch-discuss list (https://www.ietf.org/mailman/listinfo/Architecture-discuss).

Finally, {{concl}} draws some conclusions for next steps.

