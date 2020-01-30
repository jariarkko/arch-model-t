
# Potential changes in BCP 72/RFC 3552 {#changes3552}

BCP 72/RFC 3553 {{RFC3552}} defines an "Internet Threat Model" and provides
guidance on writing Security Considerations sections in other RFCs.  It is
important to note that BCP 72 is (or should be:-) used by all IETF participants
when developing protocols.  Potential changes to RFC 3552
therefore need to be brief - IETF participants cannot in general be expected
to devote huge amounts of time to developing their security considerations
text.  Potential changes also need to be easily understood as IETF participants
from all backgrounds need to be able to use BCP 72. In this section
we provide a couple of initial suggested changes to BCP 72 that will
need to be further developed as part of this work. (For example, it
may be possible to include some of the guidelines from {{guidelinessect}}
as those are further developed.)

As evidenced in the OAuth quote in {{studysect}} - it can be useful to conside
the effect of compromised endpoints on those that are not compromised.  It may
therefore be interesting to consider the consequeneces that would follow from a
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

In addition, the following new section could be added to discuss the
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

