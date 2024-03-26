# Tome

![Tests](https://github.com/vitormcruz/tome/actions/workflows/tome-ci.yml/badge.svg)

Tome is a Pharo framework that enables creation of Executable Specifications (not implemented yet) allowing the adoption of [ATDD](https://en.wikipedia.org/wiki/Acceptance_test-driven_development) discipline more generally, or simply the adoption of [BDD](https://dannorth.net/introducing-bdd/) by developers.



To become an Executable Specification.... (to be done)

## Executable Specification
Executable Specification is an advance on the TDD, BDD and documentation practices that tries to connect requirements documentation to the tests, thus creating a "live documentation" of sorts that is used as an updated documentation of the system and as an automated way to validate the system against it's requirements. 

One of the problems of documentation is that they frequently get out of date, and keeping them updated is costly: hard, tedious and time consuming, while not providing any new functionality. Among the advantages of automated tests, one is that they provide a way to understand the functions they are testing, giving **examples** on how they should or shouldn't be used.

  > Hey! So automated test are a kind of **Documentation**!?

Yes! And, even more than that, automated tests executed in a CI verifies the system behavior, pointing out errors or behaviors **out of sync** with the **specification**. So automated tests are documentation that, if executed frequently, cannot become unawarely out of date, it will **tell the anyone** if it is out of date, otherwise the system must have bug. So, automated tests are, effectively, **Executable Specifications**!

  > Yes, but, humm, automated tests are generally very low level and technical, not usefull for anyone but developers.

Yes, and the BDD practice, for example, emerged so that tests were described upfront and in a more natual language to facilitate communication, but it was still to much constricted to the technical audience. The objective of the **Executable Specification** practice is to provide a higher level communication that could be discussed, created and changed by anyone in the team, expecially the non technical ones.

  > How so?

Instead of using, for example, Use Cases, let's decribe the requirements as Acceptance Criterias and then create examples that can be used to validate those Criterias — remember, automated testes use examples of things that pass and things that do not pass to verify the system. There is already an argably advantage of describing requirements like this, because examples are much more concrete and simple to describe and understand than another techniques, such as Use Cases that look like programming. When our Specification by Example (acceptance criteria + examples) for a functionality is done — which can be stored in a text file for example — let's link them with the system by executing them as tests in any CI or pipeline employed, making then effectivelly Executable Specifications. From now on, any change in the system that breaks the documented requirements expectations will break the Executable Specification execution as well, forcing them to be updated or the system to be fixed. The Executable Specification becomes the source for team communication, and modifications made to it will need to be reflected in the system or they will break.

From that point, ATDD discipline really shines, every development can be clearly anchored by Acceptance Criteria that was previously discussed by the whole team, clearing and bringing o bit more north to the development process. 

