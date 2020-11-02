# Analysis {#analysis}

## The Role of End-to-end {#reale2e}

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

These functional arguments align with other, practical arguments about the evolution of the Internet under the end-to-end model. The endpoints evolve quickly, often with simply having one party change the necessary software on both ends. Whereas waiting for network upgrades would involve potentially a large number of parties from application owners to multiple network operators.

The end-to-end model supports permissionless innovation where new innovation can flourish in the Internet without excessive wait for other parties to act.

But the details matter. What is considered an endpoint? What characteristics of Internet are we trying to optimize? This memo makes the argument that, for security purposes, there is a significant distinction between actual endpoints from a user's interaction perspective (e.g., another user) and from a system perspective (e.g., a third party relaying a message).

This memo proposes to focus on the distinction between "real ends" and other endpoints to guide the development of protocols. A conversation between one "real end" to another "real end" has necessarily different security needs than a conversation between, say, one of the "real ends" and a component in a larger system. The end-to-end argument is used primarily for the design of one protocol. The security of the system, however, depends on the entire system and potentially multiple storage, compute, and communication protocol aspects. All have to work properly together to obtain security.

For instance, a transport connection between two components of a system is not an end-to-end connection even if it encompasses all the protocol layers up to the application layer. It is not end-to-end, if the information or control function it carries actually extends beyond those components. For instance, just because an e-mail server can read the contents of an e-mail message does not make it a legitimate recipient of the e-mail.

This memo also proposes to focus on the "need to know" aspect in systems. Information should not be disclosed, stored, or routed in cleartext through parties that do not absolutely need to have that information. 

The proposed argument about real ends is as follows:

> Application functions are best realised by the entities directly
> serving the users, and when more than one entity is involved, by
> end-to-end protocols. The role and authority of any additional
> entities necessary to carry out a function should match their
> part of the function. No information or control roles should be
> provided to these additional entities unless it is required by
> the function they provide.

For instance, a particular piece of information may be necessary for the other real endpoint, such as message contents for another user. The same piece of information may not be necessary for any additional parties, unless the information had to do with, say, routing information for the message to reach the other user. When information is only needed by the actual other endpoint, it should be protected and be only relayed to the actual other endpoint. Protocol design should ensure that the additional parties do not have access to the information.

Note that it may well be that the easiest design approach is to send all information to a third party and have majority of actual functionality reside in that third party. But this is a case of a clear tradeoff between ease of change by evolving that third party vs. providing reasonable security against misuse of information.

Note that the above "real ends" argument is not limited to communication systems. Even an application that does not communicate with anyone else than its user may be implemented on top of a distributed system where some information about the user is exposed to untrusted parties.

The implications of the system security also extend beyond information and control aspects. For instance, poorly design component protocols can become DoS vectors which are then used to attack other parts of the system. Availability is an important aspect to consider in the analysis along other aspects.

## Trusted networks {#trusted}

Some systems are thought of as being deployed only in a closed setting, where all the relevant nodes are under direct control of the network administrators. Technologies developed for such networks tend to be optimized, at least initially, for these environments, and may lack security features necessary for different types of deployments.

It is well known that many such systems evolve over time, grow, and get used and connected in new ways. For instance, the collaboration and mergers between organizations, and new services for customers may change the system or its environment. A system that used to be truly within an administrative domain may suddenly need to cross network boundaries or even run over the Internet. As a result, it is also well known that it is good to ensure that underlying technologies used in such systems can cope with that evolution, for instance, by having the necessary security capabilities to operate in different environments.

In general, the outside vs. inside security model is outdated for most situations, due to the complex and evolving networks and the need to support mixture of devices from different sources (e.g., BYOD networks). Network virtualization also implies that previously clear notions of local area networks and physical proximity may create an entirely different reality from what appears from a simple notion of a local network.

Similarly, even trusted, well-managed parties can be problematic, even  when operating openly in the Internet. Systems that collect data from a large number of Internet users, or that are used by a large number of devices have some inherent issues: large data stores attract attempts to use that data in a manner that is not consistent with the users' interests. They can also become single points of failure through network management, software, or business failures. See also {{I-D.arkko-arch-infrastructure-centralisation}}.

### Even closed networks can have compromised nodes

This memo argues that the situation is even more dire than what was explained above. It is impossible to ensure that all components in a network are actually trusted. Even in a closed network with carefully managed components there may be compromised components, and this should be factored into the design of the system and protocols used in the system.

For instance, during the Snowden revelations it was reported that internal communication flows of large content providers were compromised in an effort to acquire information from large numbers of end users. This shows the need to protect not just communications targeted to go over the Internet, but in many cases also internal and control communications.

Furthermore, there is a danger of compromised nodes, so communications security alone will be insufficient to protect against this. The defences against this include limiting information within networks to the parties that have a need to know, as well as limiting control capabilities. This is necessary even when all the nodes are under the control of the same network manager; the network manager needs to assume that some nodes and communications will be compromised, and build a system to mitigate or minimise attacks even under that assumption.

Even airgapped networks can have these issues, as evidenced, for instance, by the Stuxnet worm. The Internet is not the only form of connectivity, as most systems include, for instance, USB ports that proved to be the achilles heel of the targets in the Stuxnet case. More commonly, every system runs large amount of software, and it is often not practical or even possible to prevent compromised code even in a high-security setting, let alone in commercial or private networks. Installation media, physical ports, both open source and proprietary programs, firmware, or even innocent-looking components on a circuit board can be suspect. In addition, complex underlying computing platforms, such as modern CPUs with underlying security and management tools are prone to problems.

In general, this means that one cannot entirely trust even a closed system where you picked all the components yourself. Analysis for the security of many interesting real-world systems now commonly needs to include cross-component attacks, e.g., the use of car radios and other externally communicating devices as part of attacks launched against the control components such as brakes in a car {{Savage}}.

## Balancing Threats

Note that not all information needs to be protected, and not all
threats can be protected against. But it is important that the main
threats are understood and protected against.  Nothing is this
document should be taken as a blanket reason to provide no information
to anyone, or (impractically) insist on encrypting everything, or
other extreme measures. But designers should be informed about the
trade-offs they make.

Sometimes there are higher-level mechanisms that provide safeguards for failures. For instance, it is very difficult in general to protect against denial-of-service against compromised nodes on a communications path. However, it may be possible to detect that a service has failed.

Another example is from packet-carrying networks. Payload traffic that has been properly protected with encryption does not provide much value to an attacker. For instance, it does not always make sense to encrypt every packet transmission in a packet-carrying system where the traffic is already encrypted at other layers. But it almost always makes sense to protect control communications and to understand the impacts of compromised nodes, particularly control nodes.



