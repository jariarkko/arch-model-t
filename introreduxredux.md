# Introduction {#introduction}
 
Communications security has been at the center of many security improvements in
the Internet. The goal has been to ensure that communications are protected
against outside observers and attackers. At the IETF, this approach has been
formalized in BCP 72 {{RFC3552}}, which defined the Internet threat model in
2003.

The purpose of a threat model is to outline what threats exist in order to
assist the protocol designer. But RFC 3552 also ruled some threats to be in
scope and of primary interest, and some threats out of scope {{RFC3552}}:

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

However, the communications-security -only threat model is becoming outdated.
Some of the causes for this are:

* Success! Advances in protecting most of our communications with
  strong cryptographic means. This has resulted in much improved
  communications security, but also highlights the need for addressing
  other, remaining issues. This is not to say that communications
  security is not important, it still is. Fortunately, there are
  ongoing projects working on improvements.

* Adversaries have increased their pressure against other avenues of
  attack, from supply-channel attacks, to compromising devices to
  legal coercion of centralized endpoints in conversations.

* New adversaries and risks have arisen, e.g., due to creation of large
  centralized information sources.

* While communications-security does seem to be required to protect
  privacy, more is needed, especially if endpoints choose to act
  against the interests of their peers or users.

In short, attacks are migrating towards the currently easier targets, which no
longer necessarily include direct attacks on traffic flows.

It is important that when it comes to basic Internet infrastructure,
our chosen technologies lead to minimal exposure with respect to the
non-communications threats. It is particularly important to ensure
that non-communications security related threats are properly
understood for any new Internet technology. The sole consideration of
communications security aspects in designing Internet protocols may
lead to accidental or increased impact of security issues
elsewhere. For instance, allowing a participant to unnecessarily
collect or receive information may lead to a similar effect as
described in {{RFC8546}} for protocols: over time, unnecessary
information will get used with all the associated downsides,
regardless of what deployment expectations there were during protocol
design.

The rest of this memo is organized as follows. {{attacklandscape}}
makes some observations about the threa situation.  {{principles}}
discusses some high-level principles that could be used to address
some of the emerging issues.
