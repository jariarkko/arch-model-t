---
title: Challenges and Changes in the Internet Threat Model
abbrev: Internet Threat Model Evolution
docname: draft-arkko-farrell-arch-model-t
date:
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
    email: jari.arkko@piuha.net
  -
    ins: S. Farrell
    name: Stephen Farrell
    org: Trinity College Dublin
    email: stephen.farrell@cs.tcd.ie

informative:
  RFC1958:
  RFC3935: 
  RFC3552:
  RFC4655:
  RFC6480:
  RFC6797:
  RFC6973:
  RFC7258:
  RFC7469:
  RFC7540:
  RFC7817:
  RFC8446:
  RFC8484:
  RFC8546:
  RFC8555:
  I-D.nottingham-for-the-users:
  I-D.ietf-tls-esni:
  I-D.ietf-quic-transport:
  I-D.ietf-httpbis-expect-ct:
  I-D.farrell-etm:
  Saltzer:
   title: End-To-End Arguments in System Design
   date: November 1984
   author:
    - ins: J.H. Saltzer
    - ins: D.P. Reed
    - ins: D.D. Clark
   seriesinfo: ACM TOCS, Vol 2, Number 4, pp 277-288
  Savage:
   title: "Modern Automotive Vulnerabilities: Causes, Disclosures, and Outcomes"
   date: 2016
   author:
    - ins: S. Savage
   seriesinfo: USENIX
  Tracking:
   title: "Web Tracking-A Literature Review on the State of Research"
   date: 2018
   author:
    - ins: T. Ermakova
    - ins: B. Fabian
    - ins: B. Bender
    - ins: K. Klimek
   seriesinfo: "Proceedings of the 51st Hawaii International Conference on System Sciences, https://scholarspace.manoa.hawaii.edu/bitstream/10125/50485/paper0598.pdf"
  Bloatware:
   title: "An Analysis of Pre-installed Android Software"
   date: 2019
   author:
    - ins: G. Gamba
    - ins: M. Rashed
    - ins: A. Razaghpanah
    - ins: J. Tapiado
    - ins: N. Vallina
   seriesinfo: "arXiv preprint arXiv:1905.02713 (2019)"
  Cambridge:
   title: "User Data Privacy: Facebook, Cambridge Analytica, and Privacy Protection"
   date: 2018
   author:
    - ins: J. Isaak
    - ins: M. Hanna
   seriesinfo: "Computer 51.8 (2018): 56-59, https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=8436400"
  Unread:
   title: "The biggest lie on the internet{:} Ignoring the privacy policies and terms of service policies of social networking services"
   date: 2018
   author:
    - ins: J. Obar
    - ins: A. Oeldorf
   seriesinfo: "Information, Communication and Society (2018): 1-20"
  Vpns:
   title: "An empirical analysis of the commercial VPN ecosystem"
   date: 2018
   author:
    - ins: M. Khan
    - ins: J. DeBlasio
    - ins: G. Voelker
    - ins: A. Snoeren
    - ins: C. Kanich
    - ins: N. Vallina
   seriesinfo: "ACM Internet Measurement Conference 2018 (pp. 443-456), https://eprints.networks.imdea.org/1886/1/imc18-final198.pdf"
  Toys:
   title: "Security and Privacy Analyses of Internet of Things Childrens' Toys"
   date: 2019
   author:
    - ins: G. Chu
    - ins: N. Apthorpe
    - ins: N. Feamster
   seriesinfo: "IEEE Internet of Things Journal 6.1 (2019): 978-985, https://arxiv.org/pdf/1805.02751.pdf"
  Mailbug:
   title: "I never signed up for this! Privacy implications of email tracking"
   date: 2018
   author:
    - ins: S. Englehardt
    - ins: J. Han
    - ins: A. Narayanan
   seriesinfo: "Proceedings on Privacy Enhancing Technologies 2018.1 (2018): 109-126, https://www.degruyter.com/downloadpdf/j/popets.2018.2018.issue-1/popets-2018-0006/popets-2018-0006.pdf"
  Curated:
   title: "A large-scale empirical study on the effects of code obfuscations on Android apps and anti-malware products"
   date: 2018
   author:
    - ins: M. Hammad
    - ins: J. Garcia
    - ins: S. MaleK
   seriesinfo: "ACM International Conference on Software Engineering 2018, https://www.ics.uci.edu/~seal/publications/2018ICSE_Hammad.pdf"
  SmartTV:
   title: "What Can’t Data Be Used For? Privacy Expectations about Smart TVs in the U.S."
   date: 2018
   author:
    - ins: N. Malkin
    - ins: J. Bernd
    - ins: M. Johnson
    - ins: S. Egelman
   seriesinfo: European Workshop on Usable Security (Euro USEC), https://www.ndss-symposium.org/wp-content/uploads/2018/06/eurousec2018_16_Malkin_paper.pdf"
  Home:
   title: "Rethinking home network security"
   date: 2018
   author:
    - ins: N. Nthala
    - ins: I. Flechais
   seriesinfo: "European Workshop on Usable Security (EuroUSEC), https://ora.ox.ac.uk/objects/uuid:e2460f50-579b-451b-b14e-b7be2decc3e1/download_file?safe_filename=bare_conf_EuroUSEC2018.pdf&file_format=application%2Fpdf&type_of_work=Conference+item"
  Attitude:
   title: "User Perceptions of Sharing, Advertising, and Tracking"
   date: 2015
   author:
   seriesinfo: "Symposium on Usable Privacy and Security (SOUPS), https://www.usenix.org/conference/soups2015/proceedings/presentation/chanchary"
  Abusecases:
   title: "Using abuse case models for security requirements analysis"
   date: 1999
   author:
    - ins: J. McDermott
    - ins: C. Fox
   seriesinfo: "IEEE Annual Computer Security Applications Conference (ACSAC'99), https://www.acsac.org/1999/papers/wed-b-1030-john.pdf"
  Troll:
   title: "Examining trolls and polarization with a retweet network"
   date: 2018
   author:
    - ins: L. Stewart
    - ins: A. Arif
    - ins: K. Starbird
   seriesinfo: "ACM Workshop on Misinformation and Misbehavior Mining on the Web, https://faculty.washington.edu/kstarbi/examining-trolls-polarization.pdf"
  Sybil:
    title: "An analysis of social network-based sybil defenses"
    date: 2011
    author:
    - ins: B. Viswanath
    - ins: A. Post
    - ins: K. Gummadi
    - ins: A. Mislove
    seriesinfo: "ACM SIGCOMM Computer Communication Review 41(4), 363-374, https://conferences.sigcomm.org/sigcomm/2010/papers/sigcomm/p363.pdf"
  HijackDet:
   title: "Investigating the nature of routing anomalies: Closing in on subprefix hijacking attacks"
   date: 2015
   author:
    - ins: J. Schlamp
    - ins: R. Holz
    - ins: O. Gasser
    - ins: A. Korste
    - ins: Q. Jacquemart
    - ins: G. Carle
    - ins: E. Biersack
   seriesinfo: "International Workshop on Traffic Monitoring and Analysis, pp. 173-187. Springer, Cham, https://www.net.in.tum.de/fileadmin/bibtex/publications/papers/schlamp_TMA_1_2015.pdf"
  BgpHijack:
   title: "A survey among network operators on BGP prefix hijacking"
   date: 2018
   author:
    - ins: P. Sermpezis
    - ins: V. Kotronis
    - ins: A. Dainotti
    - ins: X. Dimitropoulos
   seriesinfo: "ACM SIGCOMM Computer Communication Review 48, no. 1 (2018): 64-69, https://arxiv.org/pdf/1801.02918.pdf"
--- abstract

Communications security has been at the center of many security improvements in the Internet. The goal has been to ensure that communications are protected against outside observers and attackers.

This memo suggests that the existing threat model, while important and still valid, is no longer alone sufficient to cater for the pressing security issues in the Internet. For instance, it is also necessary to protect systems against endpoints that are compromised, malicious, or whose interests simply do not align with the interests of the users. While such protection is difficult, there are some measures that can be taken.

It is particularly important to ensure that as we continue to develop Internet technology, non-communications security related threats are properly understood.

--- middle

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

In short, attacks are migrating towards the currently easier targets, which no longer necessarily include direct attacks on traffic flows. In addition, trading information about users and ability to influence them has become a common practice for many Internet services, often without consent of the users.

This memo suggests that the existing threat model, while important and still valid, is no longer alone sufficient to cater for the pressing security issues in the Internet. For instance, while it continues to be very important to protect Internet communications against outsiders, it is also necessary to protect systems against endpoints that are compromised, malicious, or whose interests simply do not align with the interests of the users.

Of course, there are many trade-offs in the Internet on who one chooses to interact with and why or how. It is not the role of this memo to dictate those choices. But it is important that we understand the implications of different practices. It is also important that when it comes to basic Internet infrastructure, our chosen technologies lead to minimal exposure with respect to the non-communications threats.

It is particularly important to ensure that non-communications security related threats are properly understood for any new Internet technology. While the consideration of these issues is relatively new in the IETF, this memo provides some initial ideas about potential broader threat models to consider when designing protocols for the Internet or when trying to defend against pervasive monitoring. Further down the road, updated threat models could result in changes in BCP 72 {{RFC3552}} (guidelines for writing security considerations) and BCP 188 {{RFC7258}} (pervasive monitoring), to include proper consideration of non-communications security threats.

It may also be necessary to have dedicated guidance on how systems design and architecture affects security. The sole consideration of communications security aspects in designing Internet protocols may lead to accidental or increased impact of security issues elsewhere. For instance, allowing a participant to unnecessarily collect or receive information may be lead to a similar effect as described in {{RFC8546}} for protocols: over time, unnecessary information will get used with all the associated downsides, regardless of what deployment expectations there were during protocol design. 

The rest of this memo is organized as follows. {{situationanalysis}} analyzes the situation, with respect to communications security in {{commsec}}, beyond it {{beyondcommsec}}, and in {{examples}} looks at a number of real-world examples.

{{reale2e}} discusses how the authors believe the Internet threat model should evolve, and what types of threats should be seen as critical ones and in-scope. {{guidelines}} will also discuss high-level guidance to addressing these threats.

{{changes}} outlines the author's suggested future changes to RFC 3552 and RFC 7258 and the need for guidance on the impacts of system design and architecture on security. Comments are solicited on these and other aspects of this document. The best place for discussion is on the arch-discuss list (https://www.ietf.org/mailman/listinfo/Architecture-discuss). This memo acts also as an input for the IAB retreat discussion on threat models, and it is a submission for the IAB DEDR workshop (https://www.iab.org/activities/workshops/dedr-workshop/).

Finally, {{otherwork}} highlights other discussions in this problem space and {{concl}} draws some conclusions for next steps.

# Situation Analysis {#situationanalysis}

## Improvements in Communications Security {#commsec}

The fraction of Internet traffic that is cryptographically protected has grown tremendously in the last few years. Several factors have contributed to this change, from Snowden revelations to business reasons and to better available technology such as HTTP/2 {{RFC7540}}, TLS 1.3 {{RFC8446}}, QUIC {{I-D.ietf-quic-transport}}.

In many networks, the majority of traffic has flipped from being cleartext to being encrypted. Reaching the level of (almost) all traffic being encrypted is no longer something unthinkable but rather a likely outcome in a few years.

At the same time, technology developments and policy choices have driven the scope of cryptographic protection from protecting only the pure payload to protecting much of the rest as well, including far more header and meta-data information than was protected before. For instance, efforts are ongoing in the IETF to assist encrypting transport headers {{I-D.ietf-quic-transport}}, server domain name information in TLS {{I-D.ietf-tls-esni}}, and domain name queries {{RFC8484}}.

There has also been improvements to ensure that the security protocols that are in use actually have suitable credentials and that those credentials have not been compromised, see, for instance, Let's Encrypt {{RFC8555}}, HSTS {{RFC6797}}, HPKP {{RFC7469}}, and Expect-CT {{I-D.ietf-httpbis-expect-ct}}.

This is not to say that all problems in communications security have been resolved -- far from it. But the situation is definitely different from what it was a few years ago. Remaining issues will be and are worked on; the fight between defense and attack will also continue. Communications security will stay at the top of the agenda in any Internet technology development.

## Issues in Security Beyond Communications Security {#beyondcommsec}

There are, however, significant issues beyond communications security in the Internet. To begin with, it is not necessarily clear that one can trust all the endpoints.

Of course, the endpoints were never trusted, but the pressures against endpoints issues seem to be mounting. For instance, the users may not be in as much control over their own devices as they used to be due to manufacturer-controlled operating system installations and locked device ecosystems. And within those ecosystems, even the applications that are available tend to have features that users by themselves would most likely not desire to have, such as excessive rights to media, location, and peripherals. There are also designated efforts by various authorities to hack end-user devices as a means of intercepting data about the user.

The situation is different, but not necessarily better on the side of servers. The pattern of communications in today's Internet is almost always via a third party that has at least as much information than the other parties have. For instance, these third parties are typically endpoints for any transport layer security connections, and able to see any communications or other messaging in cleartextx. There are some exceptions, of course, e.g., messaging applications with end-to-end protection.

With the growth of trading users' information by many of these third parties, it becomes necessary to take precautions against endpoints that are compromised, malicious, or whose interests simply do not align with the interests of the users.

Specifically, the following issues need attention:

* Security of users' devices and the ability of the user to control their own equipment.

* Leaks and attacks related to data at rest.

* Coercion of some endpoints to reveal information to authorities or surveillance organizations, sometimes even in an extra-territorial fashion.

* Application design patterns that result in cleartext information passing through a third party or the application owner.

* Involvement of entities that have no direct need for involvement for the sake of providing the service that the user is after.

* Network and application architectures that result in a lot of information collected in a (logically) central location.

* Leverage and control points outside the hands of the users or end-user device owners.

For instance, while e-mail transport security {{RFC7817}} has become much more widely distributed in recent years, progress in securing e-mail messages between users has been much slower. This has lead to a situation where e-mail content is considered a critical resource by mail providers who use it for machine learning, advertisement targeting, and other purposes.

The Domain Name System (DNS) shows signs of ageing but due to the legacy of deployed systems, has changed very slowly. Newer technology {{RFC8484}} developed at the IETF enables DNS queries to be performed confidentially, but its deployment is happening mostly in browsers that use global DNS resolver services, such as Cloudflare's 1.1.1.1 or Google's 8.8.8.8. This results in faster evolution and better security for end users.

However, if one steps back and considers the overall security effects of these developments, the resulting effects can be different. While the security of the actual protocol exchanges improves with the introduction of this new technology, at the same time this implies a move from using a worldwide distributed set of DNS resolvers into more centralised global resolvers. While these resolvers are very well maintained (and a great service), they are potential high-value targets for pervasive monitoring and Denial-of-Service (DoS) attacks. In 2016, for example, DoS attacks were launched against Dyn, one of the largest DNS providers, leading to some outages. It is difficult to imagine that DNS resolvers wouldn't be a target in many future attacks or pervasive monitoring projects.

Unfortunately, there is little that even large service providers can do to refuse authority-sanctioned pervasive monitoring. As a result it seems that the only reasonable course of defense is to ensure that no such information or control point exists.

There are other examples about the perils of centralised solutions in Internet infrastructure. The DNS example involved an interesting combination of information flows (who is asking for what domain names) as well as a potential ability to exert control (what domains will actually resolve to an address). Routing systems are primarily about control. While there are intra-domain centralized routing solutions (such as PCE {{RFC4655}}), a control within a single administrative domain is usually not the kind of centralization that we would be worried about. Global centralization would be much more concerning. Fortunately, global Internet routing is performed a among peers. However, controls could be introduced even in this global, distributed system. To secure some of the control exchanges, the Resource Public Key Infrastructure (RPKI) system ({{RFC6480}}) allows selected Certification Authorities (CAs) to help drive decisions about which participants in the routing infrastructure can make what claims. If this system were globally centralized, it would be a concern, but again, fortunately, current designs involve at least regional distribution.

In general, many recent attacks relate more to information than communications. For instance, personal information leaks typically happen via information stored on a compromised server rather than capturing communications. There is little hope that such attacks can be prevented entirely. Again, the best course of action seems to be avoid the disclosure of information in the first place, or at least to not perform that in a manner that makes it possible that others can readily use the information.

## Examples of deliberate adversarial behaviour in applications {#examples}

In this section we describe a few documented examples of deliberate adversarial
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
do act primarily in the best interests of their users. So this section is
not intended as a slur on all or some application developers.

### Malware in curated application stores

Despite the best efforts of curators, so-called App-Stores frequently 
distribute malware of many kinds and one recent study [@?Curated]
claims that simple obfuscation enables malware to avoid detection by
even sophisticated operators. Given the
scale of these deployments, ditribution of even a small percentage of malware-infected
applictions can affect a huge number of people.

### Virtual private networks (VPNs)

Virtual private networks (VPNs) are supposed to hide user traffic to various
degrees depending on the particular technology chosen by the VPN provider.
However, not all VPNs do what they say, some for example misrepresenting the
countries in which they provide vantage points. [@?Vpns] 

### Compromised (home) networks

What we normally might consider network devices such as home routers do also run
applications that can end up being adversarial, for example running DNS and DHCP
attacks from home routers targeting other devices in the home. One study [home]
reports on a 2011 attack that affected 4.5 million DSL modems in Brazil.  The
absence of software update [@?RFC8240] has been a major cause of these issues
and rises to the level that considering this as intentional behaviour by 
device vendors who have chosen this path is warranted.

### Web browsers

Tracking of users in order to support advertising based business models is
ubiquitous on the Internet today.  HTTP header fields (such as cookies) are
commonly used for such tracking, as are structures within the content of HTTP
responses such as links to 1x1 pixel images and (ab)use of Javascript APIs
offered by browsers. [@?Tracking] 

While some people may be sanguine about this kind of tracking, others consider
this behaviour unwelcome, when or if they are informed that it happens,
[@?Attitude] though the evidence here seems somewhat harder to interpret and many
studies (that we have found to date) involve small numbers of users.
Historically, browsers have not made this kind of tracking visible and have
enabled it by default, though some recent browser versions are starting to
enable visibility and blocking of some kinds of tracking. Browsers are also increasingly
imposing more stringent requirements on plug-ins for varied security reasons. 

### Web site policy deception

Many web sites today provide some form of privacy policy and terms of service,
that are known to be mostly unread. [@?Unread] This implies that, legal fiction
aside, users of those sites have not in reality agreed to the specific terms
published and so users are therefore highly exposed to being exploited by web
sites, for example [@?Cambridge] is a recent well-publicised case where a
service provider abused the data of 87 million users via a partnership.  While
many web site operators claim that they care deeply about privacy, it seems
prudent to assume that some (or most?) do not in fact care about user privacy,
or at least not in ways with which many of their users would agree. And of
course, today's web sites are actually mostly fairly complex web applications
and are no longer static sets of HTML files, so calling these "web sites" is
perhaps a misnomer, but considered as web applications, that may for 
example link in advertising networks, it seems clear that
many exist that are adversarial.

### Tracking bugs in mail

Some mail user agents (MUAs) render HTML content by default (with a subset not
allowing that to be turned off, perhaps particularly on mobile devices) and
thus enable the same kind of adversarial tracking seen on the web. Attempts at
such intentional tracking are also seen many times per day by email users - in
one study [@?Mailbug] the authors estimated that 62% of leakage to third
parties was intentional, for example if leaked data included a hash of the
recipient email address. 

### Troll farms in online social networks

Online social network applications/platforms are well-known to be vulnerable to
troll farms, sometimes with tragic
[consequences,](https://www.nytimes.com/2018/10/20/us/politics/saudi-image-campaign-twitter.html)
where organised/paid sets of users deliberately abuse the application platform
for reasons invisible to a normal user.  For-profit companies building online
social networks are well aware that subsets of their "normal" users are
anything but.  In one US study, [@?Troll] sets of troll accounts were roughly
equally distributed on both sides of a controversial discussion. While Internet
protocol designers do sometimes consider sybil attacks [@?Sybil], arguably we
have not provided mechanisms to handle such attacks sufficiently well,
especially when they occur within walled-gardens. Equally, one can make the
case that some online social networks, at some points in their evolution,
appear to have prioritised counts of active users so highly that they have
failed to invest sufficient effort for detection of such troll farms.

### Smart televisions

There have been examples of so-called "smart" televisions spying on their
owners [without permission](https://www.welivesecurity.com/2013/11/22/lg-admits-that-its-smart-tvs-have-been-watching-users-and-transmitting-data-without-consent/)
and one survey of user attitudes [@?SmartTV] found "broad agreement was that it
is unacceptable for the data to be repurposed or shared" although the level of
user understanding may be questionable.  What is clear though is that such
devices generally have not provided controls for their owners that would allow
them to meaningfully make a decision as to whether or not they want to share
such data.

### Internet of things

Internet of Things (IoT) devices (which might be "so-called Internet of Things" as all devices
were already things:-) have been found extremely deficient when their security
and privacy aspects were analysed, for example children's toys. [@?Toys] While
in some cases this may be due to incompetence rather than being deliberately
adversarial behaviour, the levels of incompetence frequently seen imply that it
is valid to consider such cases as not being accidental.

### Attacks leveraging compromised high-level DNS infrastructure 

Recent
[attacks](https://krebsonsecurity.com/2019/02/a-deep-dive-on-the-recent-widespread-dns-hijacking-attacks/)
against DNS infrastructure enable subsequent targetted attacks on specific
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

### BGP hijacking

There is a clear history of BGP hijacking [@?BgpHijack] being used to ensure endpoints
connect to adversarial applications. As in the previous example, such hijacks
can be used to trick a PKI into issuing a certificate for a fake entity. Indeed
one study [@?HijackDet] used the emergence of new web server TLS key pairs during
the event, (detected via Internet-wide scans), as a distinguisher between
one form of deliberate BGP hijacking and indadvertent route leaks. 

--- back

# Acknowledgements {#ack}

The authors would like to thank the members of the IAB, participants of the IETF SAAG meeting, and numerous other people for insightful comments and discussions in this space.
