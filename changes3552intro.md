
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

However, the communications-security -only threat model may not entirely
match today's reality, as discussed in {{I-D.arkko-farrell-arch-model-t-redux}}.

The rest of this document tentatively suggests some changes to the
 BCP.  {{changes3552range}} discussses the range of potential
 changes, and {{simple3552}}, {{discussion3552}}, and
 {{detailedguidance}} present the suggested alternative changes, in
 increasing amount of detail.

Comments are solicited on this document. The best
place for discussion is on the model-t list.
(https://www.ietf.org/mailman/listinfo/model-t)
