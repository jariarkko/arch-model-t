
# Attack Landscape {#attacklandscape}

This section discusses the evolving landscape of security vulnerabilities, threats, and attacks.

## Communications Security Improvements {#commsec}

Being able to ask about threat model improvements is due to progress
already made: The fraction of Internet traffic that is
cryptographically protected has grown tremendously in the last few
years. Several factors have contributed to this change, from Snowden
revelations to business reasons and to better available technology
such as HTTP/2 {{RFC7540}}, TLS 1.3 {{RFC8446}}, QUIC
{{I-D.ietf-quic-transport}}.

In many networks, the majority of traffic has flipped from being
cleartext to being encrypted. Reaching the level of (almost) all
traffic being encrypted is no longer something unthinkable but rather
a likely outcome in a few years.

At the same time, technology developments and policy choices have
driven the scope of cryptographic protection from protecting only the
pure payload to protecting much of the rest as well, including far
more header and meta-data information than was protected before. For
instance, efforts are ongoing in the IETF to assist encrypting
transport headers {{I-D.ietf-quic-transport}}, server domain name
information in TLS {{I-D.ietf-tls-esni}}, and domain name queries
{{RFC8484}}.

There have also been improvements to ensure that the security
protocols that are in use actually have suitable credentials and that
those credentials have not been compromised, see, for instance, Let's
Encrypt {{RFC8555}}, HSTS {{RFC6797}}, HPKP {{RFC7469}}, and Expect-CT
{{I-D.ietf-httpbis-expect-ct}}.

This is not to say that all problems in communications security have
been resolved -- far from it. But the situation is definitely
different from what it was a few years ago. Remaining issues will be
and are worked on; the fight between defense and attack will also
continue. Communications security will stay at the top of the agenda
in any Internet technology development.

## Beyond Communications Security {#beyondcommsec}

There are issues beyond communications security in the Internet. It is
not necessarily clear that one can trust all the endpoints in any
protocol interaction, including the user's own devices. Managed or
closed ecosystems with multiple layers of hardware and software have
made it harder to understand or influence what your devices do.

The situation is different, but not necessarily better on the side of
servers.  Even for applications that are for user-to-user
communication, a typical pattern of communications is almost always
via an intermediary that has at least as much information as the other
parties have. For instance, these intermediaries are typically
endpoints for any transport layer security connections, and able to
see much communications or other messaging in cleartext. There are
some exceptions, of course, e.g., messaging applications with
end-to-end confidentiality protection.

For instance, while e-mail transport security {{RFC7817}} has become
much more widely deployed in recent years, progress in securing e-mail
messages between users has been much slower. This has lead to a
situation where e-mail content is considered a critical resource by
some mail service providers who use the content for machine learning,
advertisement targeting, and other purposes unrelated to message
delivery. Equally however, it is unclear how some useful anti-spam
techniques could be deployed in an end-to-end encrypted mail universe
(with today's end-to-end mail security protocols) and there are many
significant challenges should one desire to deploy end-to-end email
security at scale.

Even services that are not about user-to-user to communication often
collect information about the user.

Services that are part of the infrastructure may have security
issues.  For instance, despite progress in protecting DNS query
protocols with encryption (see, e.g., {{RFC7858}} and {{RFC8484}}),
DNS resolver services themselves may be targets for attack or sources
for leaks. For instance, the services may collect information or be
vulnerable targets of denial-of-service attacks, attacks to steal user
browsing history information, or be the target of surveillance
activities and government information requests. Infrastructure
services with information about a large number of users is collected
in small number of services are particularly attractive targets for
these attacks.

In general, many recent attacks relate more to information than
communications.  For instance, personal information leaks typically
happen via information stored on a compromised server rather than
capturing communications. There is little hope that such attacks can
be prevented entirely. Again, the best course of action seems to be
avoid the disclosure of information in the first place, or at least to
not perform that in a manner that makes it possible that others can
readily use the information.

## Accidental Vulnerabilities

Some vulnerabilities came to being through various levels of
carelessness and/or due to erroneous assumptions about the
environments in which those applications currently run at. A
vulnerability can be exploited to misuse the data for someone's own
purposes.

Some attacks in this category include hardware-related issues, for
example, Meltdown and Spectre {{MeltdownAndSpectre}}, compromised or
badly-maintained web sites or services, e.g., {{Passwords}},
supply-chain attacks, for example, the {{TargetAttack}}, and breaches
of major service providers, that many of us might have assumed would
be sufficiently capable to be the best large-scale "Identity
providers", for example, Yahoo
(https://www.wired.com/story/yahoo-breach-three-billion-accounts/),
Facebook
(https://www.pcmag.com/news/367319/facebook-stored-up-to-600m-user-passwords-in-plain-text
and many others.

## Misbehaving Applications

There are many examples of application developers doing their best to
protect the security and privacy of their users or customers. But
there are also some that do not act int he best interests of their
users. As a result, it becomes necessary to consider applications as
potentially untrusted, much in the same way that we consider
in-network actors as potential adversaries despite the many examples
of network operators who both act in the best interests of their users
and succeed in defending against attacks from others.

This can also happen indirectly. Despite the best efforts of curators,
so-called App-Stores frequently distribute malware of many kinds.

Applications may also mislead users. Many web sites today provide some
form of privacy policy and terms of service, that are known to be
mostly unread {{Unread}}. This implies that, legal fiction aside,
users of those sites have not in reality agreed to the specific terms
published and so users are therefore highly exposed to being exploited
by web sites, for example {{Cambridge}} is a recent well-publicised
case where a service provider abused the data of 87 million users via
a partnership.

## Untrustworthy Devices

Traditionally, there's been an implied trust in various parts of the
system -- such as the user's own device, nodes inside a particular
network perimeter, or nodes under a single administrative control.

Client endpoint implementations were never fully trusted, but the
environments in which those endpoints exist are changing.  Users may
not have as much control over their own devices as they used to, due
to manufacturer-controlled operating system installations and locked
device ecosystems. And within those ecosystems, even the applications
that are available tend to have privileges that users by themselves
might not desire those applications be granted, such as excessive
rights to media, location, and peripherals. There are also designated
efforts by various authorities to hack end-user devices as a means of
intercepting data about the user.

Examples of these issues are too many to list, for instance, so-called
"smart" televisions spying on their owners and one survey of user
attitudes {{SmartTV}}. Untrustworthy devices can also cause damage to
other parties, such as badly constructed IoT devices {{DynDDoS}}
attacking large Internet services.

##  Untrustworthy "Closed" Networks

Even in a closed network with carefully managed components there may
be compromised components, as evidenced in the most extreme way by the
Stuxnet worm that operated in an airgapped network. Every system runs
large amount of software, and it is often not practical or even
possible to prevent compromised code even in a high-security setting,
let alone in commercial or private networks. Installation media,
physical ports, both open source and proprietary programs, firmware,
or even innocent-looking components on a circuit board can be suspect
{{TinyChip}}. In addition, complex underlying computing platforms,
such as modern CPUs with underlying security and management tools are
prone to problems.

## Tracking {#webtracking}

One of the biggest threats to user privacy on the Web is ubiquitous
tracking. This is often done to support advertising based business
models, or more specifically advertising based business models that
attempt to find out information about the user.

While some people may be sanguine about this kind of tracking, others
consider this behaviour unwelcome, when or if they are informed that
it happens. Historically, browsers have not made this kind of tracking
visible and have enabled it by default, though some recent browser
versions are starting to enable visibility and blocking of some kinds
of tracking.

One form of tracking is by third parties. HTTP header fields (such as
cookies, {{RFC6265}}) are commonly used for such tracking, as are
structures within the content of HTTP responses such as links to 1x1
pixel images and (ab)use of Javascript APIs offered by browsers
{{Tracking}}. Whenever a resource is loaded from a server, that server
can include a cookie which will be sent back to the server on future
loads. The combination of these features makes it possible to track a
user across the Web.

This capability itself constitutes a major threat to user privacy.
Additional techniques such as cookie syncing, identifier correlation,
and fingerprinting make the problem even worse
{{I-D.wood-pearg-website-fingerprinting}}. For instance, features such
as User-Agent string, plugin and font support, screen resolution, and
timezone can yield a fingerprint that is sometimes unique to a single
user {{AmIUnique}} and which persists beyond cookie scope and
lifetime.

Third party web tracking is not the only concern. An obvious tracking
danger exists also in popular ecosystems -- such as social media
networks -- that house a large part of many users' online
existence. There is no need for a third party to track the user's
browsing as all actions are performed within a single site, where most
messaging, viewing, and sharing activities happen.

Browsers themselves or services used by the browser can also become a
potential source of tracking users. For instance, the URL/search bar
service may leak information about the user's actions to a search
provider via an "autocomplete" feature. {{Leith2020}}

Tracking through users' IP addresses or DNS queries is also a
danger. This may happen by directly observing the cleartext IP or DNS
traffic, though DNS tracking may be preventable via DNS protocols that
are secured end-to-end. But the DNS queries are also (by definition)
seen by the used DNS recursive resolver service, which may
accidentally or otherwise track the users' activities.

Tracking happens through other systems besides the web, of course. For
instance, some mail user agents (MUAs) render HTML content by default
(with a subset not allowing that to be turned off, perhaps
particularly on mobile devices) and thus enable the same kind of
adversarial tracking seen on the web.

One of the concerns with universal user tracking is that it provides
yet another avenue for pervasive surveillance {{RFC7258}}, e.g.,
intelligence agencies can tap into the databases constructed by
user tracking.
