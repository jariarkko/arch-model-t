# Observations {#situationanalysis}

## Communications Security Improvements {#commsec}

Being able to ask about threat model improvements is due to progress already made: The fraction of Internet traffic that is cryptographically protected has grown tremendously in the last few years. Several factors have contributed to this change, from Snowden revelations to business reasons and to better available technology such as HTTP/2 {{RFC7540}}, TLS 1.3 {{RFC8446}}, QUIC {{I-D.ietf-quic-transport}}.

In many networks, the majority of traffic has flipped from being cleartext to being encrypted. Reaching the level of (almost) all traffic being encrypted is no longer something unthinkable but rather a likely outcome in a few years.

At the same time, technology developments and policy choices have driven the scope of cryptographic protection from protecting only the pure payload to protecting much of the rest as well, including far more header and meta-data information than was protected before. For instance, efforts are ongoing in the IETF to assist encrypting transport headers {{I-D.ietf-quic-transport}}, server domain name information in TLS {{I-D.ietf-tls-esni}}, and domain name queries {{RFC8484}}.

There have also been improvements to ensure that the security protocols that are in use actually have suitable credentials and that those credentials have not been compromised, see, for instance, Let's Encrypt {{RFC8555}}, HSTS {{RFC6797}}, HPKP {{RFC7469}}, and Expect-CT {{I-D.ietf-httpbis-expect-ct}}.

This is not to say that all problems in communications security have been resolved -- far from it. But the situation is definitely different from what it was a few years ago. Remaining issues will be and are worked on; the fight between defense and attack will also continue. Communications security will stay at the top of the agenda in any Internet technology development.

## Beyond Communications Security {#beyondcommsec}

There are, however, significant issues beyond communications security in the
Internet. To begin with, it is not necessarily clear that one can trust all the
endpoints in any protocol interaction.

Of course, client endpoint implementations were never fully trusted, but the
environments in which those endpoints exist are changing.  For instance, users
may not have as much control over their own devices as they used to, due to
manufacturer-controlled operating system installations and locked device
ecosystems. And within those ecosystems, even the applications that are
available tend to have privileges that users by themselves might not desire
those applications be granted, such as excessive rights to media, location, and
peripherals. There are also designated efforts by various authorities to hack
end-user devices as a means of intercepting data about the user.

The situation is different, but not necessarily better on the side of servers.
The pattern of communications in today's Internet is almost always via a third
party that has at least as much information as the other parties have. For
instance, these third parties are typically endpoints for any transport layer
security connections, and able to see much communications or other messaging in
cleartext. There are some exceptions, of course, e.g., messaging applications
with end-to-end confidentiality protection.

With the growth of trading users' information by many of these third parties,
it becomes necessary to take precautions against endpoints that are
compromised, malicious, or whose interests simply do not align with the
interests of the users.

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

For instance, while e-mail transport security {{RFC7817}} has become much more
widely deployed in recent years, progress in securing e-mail messages
between users has been much slower. This has lead to a situation where e-mail
content is considered a critical resource by some mail service providers who
use the content for machine learning, advertisement targeting, and other
purposes unrelated to message delivery. Equally however, it is unclear how some
useful anti-spam techniques could be deployed in an end-to-end encrypted mail
universe (with today's end-to-end mail security protocols) and there
are many significant challenges should one desire to deploy end-to-end
email security at scale.  

The Domain Name System (DNS) shows signs of ageing but due to the legacy of
deployed systems has changed very slowly. Newer technology {{RFC8484}}
developed at the IETF enables DNS queries to be performed with confidentiality
and authentication (of a recursive resolver), but its initial deployment is
happening mostly in browsers that use global DNS resolver services, such as
Cloudflare's 1.1.1.1 or Google's 8.8.8.8. This results in faster evolution and
better security for end users.

However, if one steps back and considers the potential security and privacy
effects of these developments, the outcome could appear different. While the
security and confidentiality of the protocol exchanges improves with the
introduction of this new technology, at the same time this could lead to a move
from using (what appears to be) a large worldwide distributed set of DNS
resolvers into a far smaller set of centralised global resolvers. While these
resolvers are very well maintained (and a great service), they are potential
high-value targets for pervasive monitoring and Denial-of-Service (DoS)
attacks. In 2016, for example, DoS attacks were launched against Dyn,
{{DynDDoS}} then one of the largest DNS providers, leading to some outages. It is
difficult to imagine that DNS resolvers wouldn't be a target in many future
attacks or pervasive monitoring projects.

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

In general, many recent attacks relate more to information than communications.
For instance, personal information leaks typically happen via information
stored on a compromised server rather than capturing communications. There is
little hope that such attacks can be prevented entirely. Again, the best course
of action seems to be avoid the disclosure of information in the first place,
or at least to not perform that in a manner that makes it possible that others
can readily use the information.

## Examples {#examples}

### Deliberate adversarial behaviour in applications

In this section we describe some documented examples of deliberate adversarial
behaviour by applications that could affect Internet protocol development.  The
adversarial behaviours described below involve various kinds of attack, varying
from simple fraud, to credential theft, surveillance and contributing to DDoS
attacks.  This is not intended to be a comprehensive nor complete survey, but
to motivate us to consider deliberate adversarial behaviour by applications.

While we have these examples of deliberate adversarial
behaviour, there are also many examples of application developers doing their
best to protect the security and privacy of their users or customers. That's
just the same as the case today where we need to consider in-network actors
as potential adversaries despite the many examples of network operators who
do act primarily in the best interests of their users.

#### Malware in curated application stores

Despite the best efforts of curators, so-called App-Stores frequently distribute malware of many kinds and one recent study {{Curated}}
claims that simple obfuscation enables malware to avoid detection by even sophisticated operators. Given the scale of these deployments, distribution of even a small percentage of malware-infected applications can affect a huge number of people.

#### Virtual private networks (VPNs)

Virtual private networks (VPNs) are supposed to hide user traffic to various degrees depending on the particular technology chosen by the VPN provider. However, not all VPNs do what they say, some for example misrepresenting the countries in which they provide vantage points {{Vpns}}.

#### Compromised (home) networks

What we normally might consider network devices such as home routers do also run
applications that can end up being adversarial, for example running DNS and DHCP
attacks from home routers targeting other devices in the home. One study {{Home}}
reports on a 2011 attack that affected 4.5 million DSL modems in Brazil.  The
absence of software update {{RFC8240}} has been a major cause of these issues
and rises to the level that considering this as intentional behaviour by 
device vendors who have chosen this path is warranted.

#### Web browsers

Tracking of users in order to support advertising based business models is
ubiquitous on the Internet today.  HTTP header fields (such as cookies) are
commonly used for such tracking, as are structures within the content of HTTP
responses such as links to 1x1 pixel images and (ab)use of Javascript APIs
offered by browsers {{Tracking}}.

While some people may be sanguine about this kind of tracking, others consider
this behaviour unwelcome, when or if they are informed that it happens,
{{Attitude}} though the evidence here seems somewhat harder to interpret and many
studies (that we have found to date) involve small numbers of users.
Historically, browsers have not made this kind of tracking visible and have
enabled it by default, though some recent browser versions are starting to
enable visibility and blocking of some kinds of tracking. Browsers are also increasingly
imposing more stringent requirements on plug-ins for varied security reasons. 

#### Web site policy deception

Many web sites today provide some form of privacy policy and terms of service,
that are known to be mostly unread {{Unread}}. This implies that, legal fiction
aside, users of those sites have not in reality agreed to the specific terms
published and so users are therefore highly exposed to being exploited by web
sites, for example {{Cambridge}} is a recent well-publicised case where a
service provider abused the data of 87 million users via a partnership.  While
many web site operators claim that they care deeply about privacy, it seems
prudent to assume that some (or most?) do not in fact care about user privacy,
or at least not in ways with which many of their users would agree. And of
course, today's web sites are actually mostly fairly complex web applications
and are no longer static sets of HTML files, so calling these "web sites" is
perhaps a misnomer, but considered as web applications, that may for 
example link in advertising networks, it seems clear that
many exist that are adversarial.

#### Tracking bugs in mail

Some mail user agents (MUAs) render HTML content by default (with a subset not
allowing that to be turned off, perhaps particularly on mobile devices) and
thus enable the same kind of adversarial tracking seen on the web. Attempts at
such intentional tracking are also seen many times per day by email users - in
one study {{Mailbug}} the authors estimated that 62% of leakage to third
parties was intentional, for example if leaked data included a hash of the
recipient email address. 

#### Troll farms in online social networks

Online social network applications/platforms are well-known to be vulnerable to
troll farms, sometimes with tragic consequences where organised/paid sets of users deliberately abuse the application platform
for reasons invisible to a normal user. For-profit companies building online
social networks are well aware that subsets of their "normal" users are
anything but.  In one US study, {{Troll}} sets of troll accounts were roughly
equally distributed on both sides of a controversial discussion. While Internet
protocol designers do sometimes consider sybil attacks {{Sybil}}, arguably we
have not provided mechanisms to handle such attacks sufficiently well,
especially when they occur within walled-gardens. Equally, one can make the
case that some online social networks, at some points in their evolution,
appear to have prioritised counts of active users so highly that they have
failed to invest sufficient effort for detection of such troll farms.

#### Smart televisions

There have been examples of so-called "smart" televisions spying on their
owners and one survey of user attitudes {{SmartTV}} found "broad agreement was that it
is unacceptable for the data to be repurposed or shared" although the level of
user understanding may be questionable.  What is clear though is that such
devices generally have not provided controls for their owners that would allow
them to meaningfully make a decision as to whether or not they want to share
such data.

#### Internet of things

Internet of Things (IoT) devices (which might be "so-called Internet of Things" as all devices
were already things:-) have been found deficient when their security
and privacy aspects were analysed, for example children's toys {{Toys}}. While
in some cases this may be due to incompetence rather than being deliberately
adversarial behaviour, the levels of incompetence frequently seen imply these aspects have simply not been considered a priority.

#### Attacks leveraging compromised high-level DNS infrastructure 

Recent attacks {{DeepDive}} against DNS infrastructure enable subsequent targeted attacks on specific
application layer sources or destinations. The general method appears to be to
attack DNS infrastructure, in these cases infrastructure that is towards the
top of the DNS naming hierarchy and "far" from the presumed targets, in order
to be able to fake DNS responses to a PKI, thereby acquiring TLS server
certificates so as to subsequently attack TLS connections from clients to
services (with clients directed to an attacker-owned server via additional fake
DNS responses). 

Attackers in these cases seem well resourced and patient - with
"practice" runs over months and with attack durations being infrequent and
short (e.g. 1 hour) before the attacker withdraws.  

These are sophisticated multi-protocol attacks, where weaknesses related to
deployment of one protocol (DNS) bootstrap attacks on another protocol (e.g.
IMAP/TLS), via abuse of a 3rd protocol (ACME), partly in order to capture user
IMAP login credentials, so as to be able to harvest message store content from
a real message store. 

The fact that many mail clients regularly poll their message store means that a
1-hour attack is quite likely to harvest many cleartext passwords or crackable
password hashes.  The real IMAP server in such a case just sees fewer
connections during the "live" attack, and some additional connections later.
Even heavy email users in such cases that might notice a slight gap in email
arrivals, would likely attribute that to some network or service outage.  

In many of these cases the paucity of DNSSEC-signed zones (about 1% of existing
zones) and the fact that many resolvers do not enforce DNSSEC validation (e.g.,
in some mobile operating systems) assisted the attackers. 

It is also notable that some of the personnel dealing with these attacks
against infrastructure entites are authors of RFCs and Internet-drafts. That we
haven't provided protocol tools that better protect against these kinds of
attack ought hit "close to home" for the IETF.

In terms of the overall argument being made here, the PKI and DNS interactions,
and the last step in the "live" attack all involve interaction with a
deliberately adversarial application. Later, use of acquired login credentials
to harvest message store content involves an adversarial client application.
It all cases, a TLS implementation's PKI and TLS protocol code will see the
fake endpoints as protocol-valid, even if, in the real world, they are clearly
fake. This appears to be a good argument that our current threat model is
lacking in some respect(s), even as applied to our currently most important
security protocol (TLS).

#### BGP hijacking

There is a clear history of BGP hijacking {{BgpHijack}} being used to ensure endpoints
connect to adversarial applications. As in the previous example, such hijacks
can be used to trick a PKI into issuing a certificate for a fake entity. Indeed
one study {{HijackDet}} used the emergence of new web server TLS key pairs during
the event, (detected via Internet-wide scans), as a distinguisher between
one form of deliberate BGP hijacking and inadvertent route leaks. 

#### Anti-virus vendor selling user clickstream data

An anti-virus product vendor was feeding user clickstream data to a subsidiary
that then sold on supposedly "anonymised" but highly detailed data to unrelated
parties.  {{avleak}} After browser makers had removed that vendor's browser
extension from their online stores, the anti-virus product itself apparently
took over data collection initially only offering users an opt-out, with the
result that apparently few users were even aware of the data collection, never
mind the subsequent clickstream sales. Very shortly after publication of
{{avleak}}, the anti-virus vendor announced they were closing down the
subsidiary. 

### Inadvertent adversarial behaviours

Not all adversarial behaviour by applications is deliberate, some is likely due to various levels of carelessness (some quite understandable, others not) and/or due to erroneous assumptions about the environments in which those applications (now) run.

We very briefly list some such cases:

- Application abuse for command and control, for example, use of IRC or apache
  logs for {{CommandAndControl}}

- Carelessly leaky data stores {{LeakyBuckets}}, for example, lots of Amazon S3 leaks showing that careless admins can too easily cause application server data to become available to adversaries

- Virtualisation exposing secrets, for example, Meltdown and Spectre {{MeltdownAndSpectre}} {{Kocher2019}} {{Lipp2018}} and other similar side-channel attacks.

- Compromised badly-maintained web sites, that for example, have led to massive online {{Passwords}}.

- Supply-chain attacks, for example, the {{TargetAttack}} or malware within pre-installed applications on Android phones {{Bloatware}}.

- Breaches of major service providers, that many of us might have assumed would be sufficiently capable to be the best large-scale "Identity providers", for example:

    - 3 billion accounts: https://www.wired.com/story/yahoo-breach-three-billion-accounts/
    - "up to 600M" account passwords stored in clear: https://www.pcmag.com/news/367319/facebook-stored-up-to-600m-user-passwords-in-plain-text
    - many millions at risk: https://www.zdnet.com/article/us-telcos-caught-selling-your-location-data-again-senator-demands-new-laws/
    - 50 million accounts: https://www.cnet.com/news/facebook-breach-affected-50-million-people/
    - 14 million accounts: https://www.zdnet.com/article/millions-verizon-customer-records-israeli-data/
    - "hundreds of thousands" of accounts: https://www.wsj.com/articles/google-exposed-user-data-feared-repercussions-of-disclosing-to-public-1539017194
    - unknown numbers, some email content exposed: https://motherboard.vice.com/en_us/article/ywyz3x/hackers-could-read-your-hotmail-msn-outlook-microsoft-customer-support

- Breaches of smaller service providers: Too many to enumerate, sadly 

