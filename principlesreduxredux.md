
# Principles {#principles}

Based on the above issues, it is necessary to pay attention to the following aspects:

* Security of devices, including the user's own devices.

* Security of data at rest or in use, in various parts of the system.

* Tracking and identification of users and their devices. 

* Role of servers, and in particular information passing through them.

These topics are discussed below. There are obviously many detailed technical questions and approaches to tackling them. However, in this memo we wish to focus on higher level architectural principles that might guide us in thinking about about the topics.

## Trusting Devices

In general, this means that one cannot entirely trust even a closed system where you picked all the components yourself, let alone typical commercial, networked and Internet-connected systems.

PRINCIPLE: Consider all system components as potentially untrustworthy, and consider the implications of their compromise.

There may also be ways to mitigate damages, should a compromise occur.

## Protecting Information

Data leaks have become the primary concern. Even trusted, well-managed parties can be problematic, such as when large data stores attract attempts to use that data in a manner that is not consistent with the users' interests.

Mere encryption of communications is not sufficient to protect information.

PRINCIPLE: Consider information passed to another party as a publication. Avoid passing information that should not be published.

This principle applies even if the communications that carry that information are encrypted.

PRINCIPLE: Build defences to protect information, even when some component in a system is compromised.

For instance, encryption of data at rest or in use may assist in protecting information when an attacker gainst access to a server system.

PRINCIPLE: Trust that information is handled appropriately, but verify that this is actually the case.

It is not wise to merely trust that someone acts correctly, without mistakes, and does not misuse your information. When we send packets over the Internet, we encrypt them and know that they can only received by a specific party. Similarly, if we send information to a server, we can, for instance:

* encrypt a message only to the actual final recipient, even if the server holds our message before it is delivered
* verify (e.g., through confidential computing attestations) that the server runs a software that we know does not leak our information

## Tracking

Information leakage is particularly harmful in situations where the information can be traced to an individual, such as is the case with any information that users would consider private, be it about messages to another users, browsing history, or even user's medical information.

PRINCIPLE: Assume that every interaction with another party can result in fingerprinting or identification of the user in question.

In many cases there are readily available user identifiers in data that is leaked. But even when such identifiers are not present, there is often an opportunity to narrow down which entity is connecting, through, for instance, geolocation or fingerprinting.

## Role of End-to-End

{{RFC1958}} noted that "end-to-end functions can best be realised by
end-to-end protocols". This functional argument aligns with other,
practical arguments about the evolution of the Internet under the
end-to-end model. The endpoints evolve quickly, often with simply
having one party change the necessary software on both ends. The
end-to-end model supports permissionless innovation where new
innovation can flourish in the Internet without excessive wait for
other parties to act.

However, there is a significant difference between actual endpoints
from a user's interaction perspective (e.g., another user) and from a
system perspective (e.g., a party relaying a message). In general,
there needs to be distinction between the intended interaction
participants and the services used to carry this interaction
out. These services are typically implemented as servers that provide,
e.g., the messaging relay function.

Thomson {{I-D.thomson-tmi}} discusses the role of intermediaries. We
prefer to use the term services to underline how all types of services can
have issues -- including the simple case of an end-user contacting a
server for some information.

In any case, as Thomson points out, intermediaries (or services) can
provide a useful function. Networks themselves would not exist without
intermediaries that can forward communications to others. Similarly,
networks would not exist without services responding to communications
sent by end users.

PRINCIPLE: Set clear limits what all services can do, and minimise the
use of those services to cases where they are necessary.

This is a general rule, but perhaps a few examples can illustrate it:

* A router's role is to efficiently forward packets to their
  destination, not to differentiate the treatment based on what
  content is being carried.

* The role of an information service web server is to provide that
  information, not to gather the identity or personal information
  about the user accessing information.

* The role of a messaging service is to deliver messages to other
  users, not to process the contents of the messages.

Note that this principle applies at multiple layers in the stack. It
is not just about intermediaries in the network and transport layers,
but also intermediaries and services on the application layer.

PRINCIPLE: Pass information only between the "real ends" of a
conversation, unless the information is necessary for a useful
function in a service.

For instance, a transport connection between two components of a
system is not an end-to-end connection even if it encompasses all the
protocol layers up to the application layer. It is not end-to-end, if
the information or control function it carries actually extends beyond
those components. For instance, just because an e-mail server can read
the contents of an e-mail message does not make it a legitimate
recipient of the e-mail.

PRINCIPLE: Information should not be disclosed, stored, or routed in
cleartext through services that do not absolutely need to have that
information for the function they perform.

This the "need to know" principle. It also relates to the discussion
in {{I-D.thomson-tmi}}, in that the valuable functions provided by
intermediaries need to be balanced against the information that they
need to perform their function.
