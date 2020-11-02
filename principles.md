
# Principles {#principles}

TBD...

Unfortunately, there is little that even large service providers can do to not
be a DDoS target, (though anycast and other DDoS mitigations can certainly help
when one is targeted), nor to refuse authority-sanctioned pervasive
monitoring. As a result it seems that a reasonable defense strategy may be to
aim for outcomes where such highly centralised control points are unnecessary or
don't handle sensitive data. (Recalling that with the DNS, meta-data about
the requestor and the act of requesting an answer are what is potentially
sensitive, rather than the content of the answer.) 

There are other examples of the perils of centralised solutions in Internet
infrastructure. The DNS example involves an interesting combination of
information flows (who is asking for what domain names) as well as a potential
ability to exert control (what domains will actually resolve to an address).
Routing systems are primarily about control. While there are intra-domain
centralized routing solutions (such as PCE {{RFC4655}}), a control within a
single administrative domain is usually not the kind of centralization that we
would be worried about. Global centralization would be much more concerning.
Fortunately, global Internet routing is performed among peers. However,
controls could be introduced even in this global, distributed system. To secure
some of the control exchanges, the Resource Public Key Infrastructure (RPKI)
system ({{RFC6480}}) allows selected Certification Authorities (CAs) to help
drive decisions about which participants in the routing infrastructure can make
what claims. If this system were globally centralized, it would be a concern,
but again, fortunately, current designs involve at least regional distribution.

Specifically, the following issues need attention:

* Security of users' devices and the ability of the user to control their own
  equipment.

* Leaks and attacks related to data at rest.

* Coercion of some endpoints to reveal information to authorities or
  surveillance organizations, sometimes even in an extra-territorial fashion.

* Application design patterns that result in cleartext information passing
  through a third party or the application owner.

* Involvement of entities that have no direct need for involvement for the sake
  of providing the service that the user is after.

* Network and application architectures that result in a lot of information
  collected in a (logically) central location.

* Leverage and control points outside the hands of the users or end-user device
  owners.

TBD...
