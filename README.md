# Tome

![Tests](https://github.com/vitormcruz/tome/actions/workflows/tome-ci.yml/badge.svg)

Tome is a Pharo framework that enables creation of Executable Specifications (not implemented yet) allowing the adoption of [ATDD](https://en.wikipedia.org/wiki/Acceptance_test-driven_development) discipline more generally, or simply the adoption of [BDD](https://dannorth.net/introducing-bdd/) by developers.

To create a Basic BDD Feature just subclass from specification test just 

```smalltalk
TomeFeature << #MyFeature
    slots: { };
    package: 'MyProject-Features'
```

Then create methods for the scenario specification and implementation, there is no naming rule, you just need to annotate it with the <scenario> pragma:

```smalltalk
MyFeature >> Scenario_Method_Name
    <scenario>
```

Tome provides the following basic API for a simple scenario:

```smalltalk
MyFeature >> Simple_Scenario_Description
    <scenario>

    self
      scenario: 'Simple scenario description'
      def: 'A scenario definition.
            Given.. When.. Then... is a popular format, but Tome do not enforces it.
           '
      run: [ "A block containing the implementation for the given scenario" ]
```

As example, let's consider a simple Acceptance Criteria: Users Must be at Major Age to be Registered

Examples derived from it could be:
  1. A User at age of 20 cannot be registered on the system
  2. A User at age of 21 can be registered on the system
  3. A User at age of 30 can be registered on the system

The first scenario can be written in Tome like this:

```smalltalk
MyFeature >> A_User_Age_20_Cannot_be_Registered
    <scenario>
    self
      scenario: 'A User at age of 20 cannot be registered on the system'
      def: 'Given a new user named "John Smith" with "20" years old
            When I try to do it's registation
            Then "equals: John Smith" can be found on the system having "equals: 20" years old registered
           '
      run: [ :newUserName :userAge :assertNewUserName :assertNewUserAge |
        | newUser |
        userRepo add: (User newNamed: newUserName; age: userAge asNumber).
        newUser := (userRepo select: [ :usr| usr name = newUserName ]) at: 1.
        assertNewUserName assertSuccessFor: newUser name. "newUser name is equals: John Smith ??"
        assertNewUserAge assertSuccessFor: newUser age. "newUser age is equals: 20 ??"
      ]
```

Rules are:
	1. All strings enclosed by quotation marks (") are considered parameters of the scenario and will be used as arguments to the `run` block parameter in order they were defined in the text. 
	2. Enclosed strings starting with `equals:` are considered assertions with special behavior. `assertSuccessFor:`, for example, is a message answered by the assertion that validate if the argument is equals to the defined value in the specification definition
	3. All parameters **must** be used, otherwise the scenario execution fails. This is an efforcement made only to reinforce the need to link the definition to it's execution.

Instead of continuing to create scenarios for the rest of the examples, since they are very similar, we can use a Scenario Outline to avoid repetitions:

```smalltalk
MyFeature >> Simple_Scenario_Description
    <scenario>

  self
    scenarioOutline: 'Simple scenario description'
    def: 'A scenario definition.
          Given.. When.. Then... is a popular format, but Tome do not enforces it.
         '
	  examples: #(    'header'   ) asHeaderFor
	            - #(  "examples" )
	            - #(    ....     )
					
    run: [ "A block containing the implementation for the given scenario outline
            it will be called once for each example" ]
```

For "Users Must be at Major Age to be registered" criteria, an implementation of a Scenario Outline would be:

```smalltalk
MyFeature >> Users_Must_be_Major
    <scenario>

  self
    scenarioOutline: 'Users Must be at Major Age to be registered'
    def: 'Given a new user named "John Smith" with "{age}" years old
          When I try to do it's registation
          Then the new user "equals: {findResult}" be found on the system
         '
	  examples: #(    'age'   'findResult'  ) asHeaderFor 
	            - #(   20       'cannot'    )
	            - #(   21       'can'       )
	            - #(   30       'can'       )
					
    run: [ :newUserName :userAge :assertFindResult |
      | findResult |
      userRepo add: (User newNamed: newUserName; age: userAge asNumber).
      findResult := (userRepo select: [ :usr| usr name = newUserName ])
	                    ifEmpty [ 'cannot' ]
	                    ifNotEmpty [ 'can' ].

      assertFindResult assertSuccessFor: findResult. 
    ]
```

Each example will instantiate a new scenario execution switching the examples header by it's value. The header is referenced by it's name enclosed by curly braces ({}), usually should be enclosed by quotation marks (") to be used as parameters of the scenario execution. In the example, we will instantiate thre scenarios:

```
Given a new user named "John Smith" with "20" years old
When I try to do it's registation
Then the new user "equals: cannot" be found on the system
```
```
Given a new user named "John Smith" with "21" years old
When I try to do it's registation
Then the new user "equals: can" be found on the system
```
```
Given a new user named "John Smith" with "30" years old
When I try to do it's registation
Then the new user "equals: can" be found on the system
```

Note how differently scenario can be written and asserted. Ideally, it must be linked as much as possible to the code through parameters and assertions so that changes to it or to the code are reflected both ways and it's execution passes or fail accordingly. For more examples and considerations about specification writting and implementation, look at the [`Tome-Tests-Examples`](https://github.com/vitormcruz/tome/tree/develop/pharo/Tome-Tests-Examples) package.


## Executable Specification 

To be done....

### Executable Specification Explanation
Executable Specification is an advance on the TDD, BDD and documentation practices that tries to connect requirements documentation to the tests, thus creating a "live documentation" of sorts that is used as an updated documentation of the system and as an automated way to validate the system against it's requirements. 

One of the problems of documentation is that they frequently get out of date, and keeping them updated is costly: hard, tedious and time consuming, while not providing any new functionality. Among the advantages of automated tests, one is that they provide a way to understand the functions they are testing, giving **examples** on how they should or shouldn't be used.

  > Hey! So automated test are a kind of **Documentation**!?

Yes! And, even more than that, automated tests executed in a CI verifies the system behavior, pointing out errors or behaviors **out of sync** with the **specification**. So automated tests are documentation that, if executed frequently, cannot become unawarely out of date, it will **tell the anyone** if it is out of date, otherwise the system must have bug. So, automated tests are, effectively, **Executable Specifications**!

  > Yes, but, humm, automated tests are generally very low level and technical, not usefull for anyone but developers.

Yes, and the BDD practice, for example, emerged so that tests were described upfront and in a more natual language to facilitate communication, but it was still to much constricted to the technical audience. The objective of the **Executable Specification** practice is to provide a higher level communication that could be discussed, created and changed by anyone in the team, expecially the non technical ones.

  > How so?

Instead of using, for example, Use Cases, let's decribe the requirements as Acceptance Criterias and then create examples that can be used to validate those Criterias — remember, automated testes use examples of things that pass and things that do not pass to verify the system. There is already an argably advantage of describing requirements like this, because examples are much more concrete and simple to describe and understand than another techniques, such as Use Cases that look like programming. When our Specification by Example (acceptance criteria + examples) for a functionality is done — which can be stored in a text file for example — let's link them with the system by executing them as tests in any CI or pipeline employed, making then effectivelly Executable Specifications. From now on, any change in the system that breaks the documented requirements expectations will break the Executable Specification execution as well, forcing them to be updated or the system to be fixed. The Executable Specification becomes the source for team communication, and modifications made to it will need to be reflected in the system or they will break.

From that point, ATDD discipline really shines, every development can be clearly anchored by Acceptance Criteria that was previously discussed by the whole team, clearing and bringing o bit more north to the development process. 

