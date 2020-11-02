
# Attack Landscape {#attacklandscape}

This section discusses the evolving landscape of security vulnerabilities, threats, and attacks.

## Communications Security Improvements {#commsec}

Being able to ask about threat model improvements is due to progress already made: The fraction of Internet traffic that is cryptographically protected has grown tremendously in the last few years. Several factors have contributed to this change, from Snowden revelations to business reasons and to better available technology such as HTTP/2 {{RFC7540}}, TLS 1.3 {{RFC8446}}, QUIC {{I-D.ietf-quic-transport}}.

In many networks, the majority of traffic has flipped from being cleartext to being encrypted. Reaching the level of (almost) all traffic being encrypted is no longer something unthinkable but rather a likely outcome in a few years.

At the same time, technology developments and policy choices have driven the scope of cryptographic protection from protecting only the pure payload to protecting much of the rest as well, including far more header and meta-data information than was protected before. For instance, efforts are ongoing in the IETF to assist encrypting transport headers {{I-D.ietf-quic-transport}}, server domain name information in TLS {{I-D.ietf-tls-esni}}, and domain name queries {{RFC8484}}.

There have also been improvements to ensure that the security protocols that are in use actually have suitable credentials and that those credentials have not been compromised, see, for instance, Let's Encrypt {{RFC8555}}, HSTS {{RFC6797}}, HPKP {{RFC7469}}, and Expect-CT {{I-D.ietf-httpbis-expect-ct}}.

This is not to say that all problems in communications security have been resolved -- far from it. But the situation is definitely different from what it was a few years ago. Remaining issues will be and are worked on; the fight between defense and attack will also continue. Communications security will stay at the top of the agenda in any Internet technology development.

## Beyond Communications Security {#beyondcommsec}

There are, however, significant issues beyond communications security in the Internet.

To begin with, it is not necessarily clear that one can trust all the endpoints in any protocol interaction. Of course, client endpoint implementations were never fully trusted, but the environments in which those endpoints exist are changing.  For instance, users may not have as much control over their own devices as they used to, due to manufacturer-controlled operating system installations and locked device ecosystems. And within those ecosystems, even the applications that are available tend to have privileges that users by themselves might not desire those applications be granted, such as excessive rights to media, location, and peripherals. There are also designated efforts by various authorities to hack end-user devices as a means of intercepting data about the user.

The situation is different, but not necessarily better on the side of servers.  Even for applications that are for user-to-user communication, a typical pattern of communications is almost always via a third party that has at least as much information as the other parties have. For instance, these third parties are typically endpoints for any transport layer security connections, and able to see much communications or other messaging in cleartext. There are some exceptions, of course, e.g., messaging applications with end-to-end confidentiality protection.

For instance, while e-mail transport security {{RFC7817}} has become much more widely deployed in recent years, progress in securing e-mail messages between users has been much slower. This has lead to a situation where e-mail content is considered a critical resource by some mail service providers who use the content for machine learning, advertisement targeting, and other purposes unrelated to message delivery. Equally however, it is unclear how some useful anti-spam techniques could be deployed in an end-to-end encrypted mail universe (with today's end-to-end mail security protocols) and there are many significant challenges should one desire to deploy end-to-end email security at scale.

Services that are not about user-to-user to communication often collect information about the user.

Even services that are part of the infrastructure may have security issues.  For instance, despite progress in protecting DNS query protocols with encryption (see, e.g., {{RFC7858}} and {{RFC8484}}), DNS resolver services themselves may be targets for attack or sources for leaks. For instance, the services may collect information or be vulnerable targets of denial-of-service attacks, attacks to steal user browsing history information, or be the target of surveillance activities and government information requests. Infrastructure services with information about a large number of users is collected in small number of services are particularly attractive targets for these attacks.

With the growth of trading users' information by many of these parties, it becomes necessary to take precautions against endpoints that are compromised, malicious, or whose interests simply do not align with the interests of the users.

In general, many recent attacks relate more to information than communications.
For instance, personal information leaks typically happen via information
stored on a compromised server rather than capturing communications. There is
little hope that such attacks can be prevented entirely. Again, the best course
of action seems to be avoid the disclosure of information in the first place,
or at least to not perform that in a manner that makes it possible that others
can readily use the information.




TBD...

##
## webtracking {#webtracking}

TBD...
