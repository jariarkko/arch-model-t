
# The range of potential changes in BCP 72/RFC 3552 {#changes3552range}

BCP 72/RFC 3553 {{RFC3552}} defines an "Internet Threat Model" and provides
guidance on writing Security Considerations sections in other RFCs.

{{RFC3552}} also provided a description of classic issues for the development
of communications security protocols. However, in the nearly 20 years
since the publication of RFC 3552, the practice of protocol design has
moved on to a fair extent.

It is
important to note that BCP 72 is (or should be:-) used by all IETF participants
when developing protocols.  Potential changes to RFC 3552
therefore need to be brief - IETF participants cannot in general be expected
to devote huge amounts of time to developing their security considerations
text.  Potential changes also need to be easily understood as IETF participants
from all backgrounds need to be able to use BCP 72.

In this section
we provide a few initial suggested changes to BCP 72 that will
need to be further developed as part of this work. (For example, it
may be possible to include some of the guidelines from
{{I-D.arkko-farrell-arch-model-t}} Section 5
as those are further developed.)

There are a range of possible updates. We could propose
adding a simple observation ({{simple3552}}), or additionally propose
further discussion about endpoint compromises and the need for
system-level security analysis ({{discussion3552}}).

Another possibility would be to add more guidance 
covering areas of concern, and recommendations of broadly-applicable techniques to
use. One suggestion (due to others) for such material is provided in
{{detailedguidance}}.

The authors of this memo believe that any updates to RFC 3552 should
be relatively high-level and short. Additional documents may be needed
to provide further detail.

# Simple change {#simple3552}

This is the simple addition we are suggesting.
As evidenced in the OAuth quote in {{I-D.arkko-farrell-arch-model-t}}
Section 4 - it can be useful to consider
the effect of compromised endpoints on those that are not compromised.  It may
therefore be interesting to consider the consequences that would follow from a
change to {{RFC3552}} that recognises how the landscape has changed since 2003. 

One initial, draft proposal for such a change could be:

OLD:

> In general, we assume that the end-systems engaging in a protocol
> exchange have not themselves been compromised.  Protecting against an
> attack when one of the end-systems has been compromised is
> extraordinarily difficult.  It is, however, possible to design
> protocols which minimize the extent of the damage done under these
> circumstances.

NEW:

> In general, we assume that the end-system engaging in a protocol
> exchange has not itself been compromised.  Protecting against an
> attack of a protocol implementation itself is extraordinarily
> difficult.  It is, however, possible to design protocols which
> minimize the extent of the damage done when the other parties in
> a protocol become compromised or do not act in the best interests
> the end-system implementing a protocol.

# Change to add discussion of compromises {#discussion3552}

The following new section could be added to discuss the
capabilities required to mount an attack:

NEW:

3.x. Other endpoint compromise

> In this attack, the other endpoints in the protocol become
> compromised. As a result, they can, for instance, misuse any
> information that the end-system implementing a protocol has sent to the
> compromised endpoint.

System and architecture aspects definitely also need more attention from
Internet technology developers and standards organizations. Here is one
possible addition:

NEW:

> The design of any Internet technology should start from an understanding
> of the participants in a system, their roles, and the extent to which they
> should have access to information and ability to control other participants.

# Change to add guidance with regards to communications security {#detailedguidance}

Finally, the following new text could be added to cover some of the
aspects that should be considered when designing a communications
security protocol that are not covered in detail in RFC 3552.

## Limiting time scope of compromise

{{RFC3552}} Section 3 says:

> The Internet environment has a fairly well understood threat model.
> In general, we assume that the end-systems engaging in a protocol
> exchange have not themselves been compromised.  Protecting against an
> attack when one of the end-systems has been compromised is
> extraordinarily difficult.  It is, however, possible to design
> protocols which minimize the extent of the damage done under these
> circumstances.

Although this text is technically correct, modern protocol designs
such as TLS 1.3 and MLS often try to provide a fair amount of defense
against various kinds of temporary compromise. Specifically:

NEW:

> Forward Security: Many protocols are designed so that compromise of
> an endpoint at time T does not lead to compromise of data
> transmitted prior to some time T' < T. For instance, if a protocol
> is based on Diffie-Hellman key establishment, then compromise of the
> long-term keys does not lead to compromise of traffic sent prior to
> compromise if the DH ephemerals and traffic keys have been deleted.
> 
> Post-Compromise Security: Conversely, if an endpoint is compromised
> at time T, it is often desirable to have the protocol "self-heal" so
> that a purely passive adversary cannot access traffic after a
> certain time T' > T. MLS, for instance, is designed with this
> property.
> 
> Containing Partial Authentication Key Compromise: If an endpoint is
> stolen and its authentication secret is stolen, then an attacker can
> impersonate that endpoint. However, there a number of scenarios in
> which an attacker can obtain use of an authentication key but not
> the secret itself (see, for instance {{Jager2015}}). It is often
> desirable to limit the impact of such compromises (for instance, by
> avoiding unlimited delegation from such keys).
>
> Short-lived keys: Typical TLS certificates last for months or years.
> There is a trend towards shorter certificate lifetimes so as to
> minimize risk of exposure in the event of key compromise. Relatedly,
> delegated credentials are short-lived keys the certificate’s owner
> has delegated for use in TLS. These help reduce private key
> lifetimes without compromising or sacrificing reliability.

## Forcing active attack

{{RFC3552}} Section 3.2 notes that it is important to consider passive
attacks. This is still valid, but needs further elaboration:

NEW:

> In general, it is much harder to mount an active attack, both in terms
> of the capabilities required and the chance of being detected.  A
> theme in recent IETF protocols design is to build systems which might
> have limited defense against active attackers but are strong against
> passive attackers, thus forcing the attacker to go active.

Examples include DTLS-SRTP and the trend towards opportunistic
security. However, ideally protocols are built with strong defenses
against active attackers. One prominent example is QUIC, which takes
steps to ensure that off-path connection resets are intractable in
practice.

## Traffic analysis

{{RFC3552}} Section 3.2.1 describes how the absence of TLS or other
transport-layer encryption may lead to obvious confidentiality
violations against passive attackers. This too is still valid, but
does not take into account additional aspects:

NEW:

> However, recent trends in traffic analysis indicate encryption alone
> may be insufficient protection for some types of application data
 > {{I-D.wood-pearg-website-fingerprinting}}. Encrypted traffic metadata,
> especially message size, can leak information about the underlying
> plaintext. DNS queries and responses are particularly at risk given
> their size distributions. Recent protocols account for this leakage by
> supporting padding.

Some examples of recent work in this area include support for padding
either generically in the transport protocol (QUIC
{{I-D.ietf-quic-transport}} and TLS {{RFC8446}}), or
specifically in the application protocol (EDNS(0) padding option for
DNS messages {{RFC7830}}).

## Containing compromise of trust points

Many protocols are designed to depend on trusted third parties (the
WebPKI is perhaps the canonical example); if those trust points
misbehave, the security of the protocol can be completely compromised.

Some additional guidance in RFC 3552 might be needed to remind
protocol readers of this.

NEW:

> A number of recent protocols have attempted to reduce the power of
> trust points that the protocol or application depends on. For
> instance, Certificate Transparency attempts to ensure that a CA cannot
> issue valid certificates without publishing them, allowing third
> parties to detect certain classes of misbehavior by those
> CA. Similarly, Key Transparency attempts to ensure that (public) keys
> associated with a given entity are publicly visible and auditable in
> tamper-proof logs. This allows users of these keys to check them for
> correctness.

In the realm of software, Reproducible Builds and Binary
Transparency are intended to allow a user to determine that they
have received a valid copy of the binary that matches the auditable
source code. Blockchain protocols such as Bitcoin and Ethereum also
employ this principle of transparency and are intended to detect
misbehavior by members of the network.

