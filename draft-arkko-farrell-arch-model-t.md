---
title: Challenges and Changes in the Internet Threat Model
abbrev: Internet Threat Model Evolution
docname: draft-arkko-farrell-arch-model-t-pre-02
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

!INCLUDE "refs.md"

--- abstract

Communications security has been at the center of many security improvements in
the Internet. The goal has been to ensure that communications are protected
against outside observers and attackers.

This memo suggests that the existing threat model, while important and still
valid, is no longer alone sufficient to cater for the pressing security issues
in the Internet. For instance, it is also necessary to protect systems against
endpoints that are compromised, malicious, or whose interests simply do not
align with the interests of the users. While such protection is difficult,
there are some measures that can be taken.

It is particularly important to ensure that as we continue to develop Internet
technology, non-communications security related threats, and privacy issues,
are properly understood.

--- middle

!INCLUDE "intro.md"
!INCLUDE "observations.md"
!INCLUDE "analysis.md"
!INCLUDE "study.md"
!INCLUDE "guidelines.md"
!INCLUDE "changes3552.md"
!INCLUDE "changes7258.md"
!INCLUDE "conclusions.md"

--- back

!INCLUDE "acks.md"
