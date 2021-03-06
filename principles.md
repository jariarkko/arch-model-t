
# Principles {#principles}

Based on the above issues, it is necessary to pay attention to the following aspects:

* Security of devices, including the user's own devices.

* Security of data at rest, in various parts of the system.

* Tracking and identification of users and their devices. 

* Role of intermediaries, and in particular information passing through them.

These topics are discussed below. There are obviously many detailed technical questions and approaches to tackling them. However, in this memo we wish to focus on higher level architectural principles that might guide us in thinking about about the topics.

## Trusting Devices

In general, this means that one cannot entirely trust even a closed system where you picked all the components yourself, let alone typical commercial, networked and Internet-connected systems.

PRINCIPLE:

: Consider all system components as potentially untrustworthy, and consider the implications of their compromise.

There may also be ways to mitigate damages, should a compromise occur.

## Protecting Information

Data leaks have become the primary concern. Even trusted, well-managed parties can be problematic, such as when large data stores attract attempts to use that data in a manner that is not consistent with the users' interests.

Mere encryption of communications is not sufficient to protect information.

PRINCIPLE:

: Consider information passed to another party as a publication to at least some number of entities.

This principle applies even if the communications that carry that information are encrypted.

## Tracking

Information leakage is particularly harmful in situations where the information can be traced to an individual, such as is the case with any information that users would consider private, be it about messages to another users, browsing history, or even user's medical information.

PRINCIPLE:

: Assume that every interaction with another party can result in fingerprinting or identification of the user in question.

In many cases there are readily available user identifiers in data that is leaked, such as was the case with a recent medical information leak in Finland {{Vastaamo}}. But even when such identifiers are not present, in many communication methods, there is ample opportunity for narrowing down which entity is connecting, through geolocation, fingerprinting, and correlation with other information.

## Role of End-to-End

{{RFC1958}} notes that "end-to-end functions can best be realised by end-to-end protocols":

> The basic argument is that, as a first principle, certain
> required end-to-end functions can only be performed correctly
> by the end-systems themselves. A specific case is that any
> network, however carefully designed, will be subject to
> failures of transmission at some statistically determined rate.
> The best way to cope with this is to accept it, and give
> responsibility for the integrity of communication to the end
> systems. Another specific case is end-to-end security.

The "end-to-end argument" was originally described by Saltzer et al {{Saltzer}}. They said:

> The function in question can completely and correctly be
> implemented only with the knowledge and help of the
> application standing at the endpoints of the communication
> system. Therefore, providing that questioned function as a
> feature of the communication system itself is not possible.

These functional arguments align with other, practical arguments about the evolution of the Internet under the end-to-end model. The endpoints evolve quickly, often with simply having one party change the necessary software on both ends. Whereas waiting for network upgrades would involve potentially a large number of parties from application owners to multiple network operators. The end-to-end model supports permissionless innovation where new innovation can flourish in the Internet without excessive wait for other parties to act.

But the details matter. What is considered an endpoint? What characteristics of Internet are we trying to optimize?

There is a significant difference between actual endpoints from a user's interaction perspective (e.g., another user) and from a system perspective (e.g., a third party relaying a message). Such intermediaries can provide a useful service. As {{I-D.thomson-tmi}} points out, networks themselves would not exist without intermediaries that can forward communications to others.

PRINCIPLE:

: Limit the use of intermediaries, and what they can do.

PRINCIPLE:

: Pass information only between the "real ends" of a conversation, unless the information is necessary for a useful function in an intermediary.

For instance, a transport connection between two components of a system is not an end-to-end connection even if it encompasses all the protocol layers up to the application layer. It is not end-to-end, if the information or control function it carries actually extends beyond those components. For instance, just because an e-mail server can read the contents of an e-mail message does not make it a legitimate recipient of the e-mail.

This memo also proposes to focus on the "need to know" aspect in systems. Information should not be disclosed, stored, or routed in cleartext through parties that do not absolutely need to have that information. This relates to the discussion in {{I-D.thomson-tmi}}, in that the valuable functions provided by intermediaries need to be balanced against the information that they need to perform their function. And, in a lot of cases unnecessary information is provided to intermediaries, which leads to privacy and other problems.
