### Part III — Practical Patterns and Best Practices

#### Chapter 13 — Patterns for Clean and Reusable Knowledge

##### What This Chapter Covers

Now that you’ve learned the core mechanics of F-Logic, it's time to look at how experienced modelers **structure knowledge** for clarity, reuse, and scale. This chapter introduces recurring patterns and best practices for clean, maintainable F-Logic code.

##### Pattern 1: Separate Data from Rules

Keep object definitions and rules in separate modules:

```prolog
% facts.flogic
alice:employee[ dept -> hr, salary -> 5000 ].

% rules.flogic
eligible_for_bonus(E) :- E:employee, E[ salary -> S ], S > 4000.
```

This helps testing, refactoring, and reuse.

##### Pattern 2: Use Class Declarations Early

Declare all classes and their slots up front:

```prolog
employee::class[ dept => string, salary => number ].
```

This documents intent and enables validation.

##### Pattern 3: Prefer Named Sets over Duplicates

Avoid writing similar objects over and over:

```prolog
languages::set[ items -> {english, french, spanish} ].
```

Then reference:

```prolog
alice[ speaks -> languages[ items ] ].
```

##### Pattern 4: Use Rule Chains

Break long logic into small composable rules:

```prolog
has_high_income(P) :- P[ salary -> S ], S > 10000.
eligible_for_gold_card(P) :- has_high_income(P), P[ dept -> finance ].
```

##### Pattern 5: Use Modules for Isolation

For larger systems, divide logic into focused modules:

- `person.flogic`
    
- `finance.flogic`
    
- `rules/eligibility.flogic`
    

Then compose with `:- use_module(...)`.

##### Pattern 6: Add Comments and Constraints

Treat F-Logic like code. Document it.

```prolog
% Ensure each course has a teacher
:- constraint course[ taught_by -> _ ].
```

##### Pattern 7: Use Sets When Relationships Are Not Unique

Avoid duplicating slot values. Use sets when cardinality is open-ended:

```prolog
project[ team -> {alice, bob, carol} ].
```

##### Pattern 8: Define Exceptions Clearly

Use negation-as-failure for expected overrides:

```prolog
flies(X) :- X:bird, not(X[ flies -> false ]).
```

This captures the default while allowing exceptions.

##### Recap

- Use separation, modularity, and rule chains for clean design.
    
- Define and document classes up front.
    
- Prefer sets, constraints, and reusable rules.
    
- Think like a software engineer when building knowledge systems.
    

---

#### Chapter 14 — Modeling Real Domains: People, Places, Events

##### What This Chapter Covers

Let’s take everything we’ve learned and apply it to real-world domains. In this chapter, we’ll model **people**, **places**, and **events** — concepts found in nearly all applications of Frame Logic.

##### Modeling People

A person might be an employee, a student, a parent — or all of the above.

```prolog
person::class[ name => string, age => number ].
employee::person[ department => string, salary => number ].
student::person[ enrolled_in => {0..* course} ].
```

You can create hybrid identities:

```prolog
alice:employee[ name -> "Alice", age -> 34, department -> "HR" ].
alice:student[ enrolled_in -> {ethics101} ].
```

##### Modeling Places

Places are usually entities with spatial properties or identifiers:

```prolog
place::class[ name => string, located_in => place ].
city::place.
country::place.

paris:city[ name -> "Paris", located_in -> france ].
france:country[ name -> "France" ].
```

##### Modeling Events

Events are things that happen in time and may involve participants.

```prolog
event::class[ occurs_on => date, location => place, participants => {0..* person} ].
meeting::event[ topic => string ].

team_meeting:meeting[
  occurs_on -> date(2025,6,26),
  location -> paris,
  participants -> {alice, bob},
  topic -> "F-Logic Roadmap"
].
```

##### Reusing Structures

Events and places are good candidates for reusable patterns:

```prolog
event::class[ occurs_on => date, location => place, ... ].
conference::event.
trip::event.
```

Modeling common templates lets you generalize reasoning over different kinds of events.

##### Adding Temporal Context

Want to track movement or status over time?

```prolog
bob[ location -> paris @ time(10:00) ].
bob[ location -> lyon @ time(14:00) ].
```

This makes it possible to reconstruct timelines.

##### Advanced Use: Event Chains

You can define that certain events imply or precede others:

```prolog
attends(P, E) :- E:meeting, E[ participants -> P ].
leads_to(E1, E2) :- E1:meeting, E2:meeting, E1[ topic -> T ], E2[ topic -> T ], E1[ occurs_on -> D1 ], E2[ occurs_on -> D2 ], D1 < D2.
```

This enables temporal and semantic reasoning.

##### Recap

- People, places, and events are central modeling elements.
    
- Use class inheritance to represent roles and relationships.
    
- Events connect time, place, and agents.
    
- You can track change over time and create event sequences.
    

---

#### Chapter 15 — Debugging and Testing Your Knowledge Base

##### What This Chapter Covers

Even the most elegant knowledge base can have bugs. This chapter introduces strategies for **debugging**, **validating**, and **testing** your F-Logic code so it behaves as expected.

##### 1. Start with Simple Queries

Start testing with very focused queries:

```prolog
?- alice[ dept -> D ].
```

This checks that basic slot information is correct.

##### 2. Use Trace Mode

ErgoAI supports tracing rule execution. You can step through inference paths to see how conclusions are derived or why something fails:

```prolog
:- trace.
?- eligible_for_bonus(alice).
```

Use `:- notrace.` to turn it off.

##### 3. Check Inferred Facts

Sometimes, you don’t know _how_ a conclusion was reached:

```prolog
?- inferred(eligible_for_bonus(alice)).
```

This confirms the rule engine derived a fact.

##### 4. Test Constraints

If you defined constraints, test their enforcement:

```prolog
alice:employee[ salary -> -100 ].  % should raise a violation
```

Or use test predicates:

```prolog
:- test(alice).
```

##### 5. Validate with Assertions

Include **test blocks** in your files:

```prolog
:- test_block "employee salary constraint".
:- assert(alice[ salary -> 10000 ]).
:- expect(alice[ salary -> S ], S > 0).
:- end_test.
```

This allows regression testing.

##### 6. Check Inheritance

Misplaced class relationships can cause surprises:

```prolog
?- alice:student.
```

Test all inherited properties explicitly.

##### 7. Debug Rule Firing

If a rule doesn’t fire:

- Is the condition wrong?
    
- Are the variables safe?
    
- Are all modules loaded?
    

Use intermediate queries to test each rule clause.

##### 8. Add Logging and Diagnostics

Use prints or logs when reasoning gets complex:

```prolog
:- on_assert(X[ salary -> S ]) :- println("Salary assigned:", S).
```

##### 9. Use Isolated Test Modules

Create minimal test files:

```prolog
% test_eligibility.flogic
alice:employee[ salary -> 8000 ].
:- assert(eligible_for_bonus(alice)).
```

Run only this module to isolate bugs.

##### Recap

- Query individual facts and rule outcomes.
    
- Use tracing and logging to inspect reasoning.
    
- Define test blocks for formal validation.
    
- Always test constraints, defaults, and exceptions.
    

---

#### Chapter 16 — Ergonomic Tips and Final Advice

##### What This Chapter Covers

This final chapter of the beginner’s manual brings together advice on working with F-Logic efficiently, maintaining your knowledge base over time, and developing the mindset of a logic programmer.

##### Use Readable Formatting

Structure your facts and rules like readable prose:

```prolog
alice:employee[
  name -> "Alice",
  salary -> 7500,
  dept -> "Finance"
].
```

Breaking lines makes complex objects easier to understand.

##### Comment Liberally

Add comments like you would in code. Future-you (or your teammates) will thank you:

```prolog
% Rule: High earners in Finance are eligible for bonuses
eligible_for_bonus(P) :- ...
```

##### Use Version Control

Treat your `.flogic` files as source code. Use Git or another version control system to:

- Track changes
    
- Revert broken edits
    
- Branch and merge logic modules
    

##### Reuse and Abstract

Avoid copy-pasting similar rules. Generalize patterns where possible:

```prolog
high_earner(P) :- P[ salary -> S ], S > 10000.
```

Then reuse it in more specific rules.

##### Test Often and Early

Don’t wait to write queries or test files. Use exploratory queries to debug as you build.

##### Start with a Minimal Kernel

Build your knowledge base like a snowball: start small, verify it works, and expand only when stable.

##### Think in Terms of Frames

Remember: F-Logic is about **objects**, **slots**, and **frames**. Think semantically — not like imperative code, but like relational knowledge.

##### Prefer Clarity over Cleverness

It’s tempting to write complex rules to show off logic tricks. Don’t. Favor understandable patterns that others can maintain.

##### When in Doubt, Use Diagrams

Draw the relationships between classes, slots, and objects. Visual reasoning often reveals gaps or redundancies.

##### Keep a Glossary

As your model grows, maintain a shared glossary of slots, class names, and naming conventions. This improves team coordination and data interoperability.

##### Final Words

Frame Logic is powerful, expressive, and robust. It takes time to master, but once you do, it becomes a unique tool for building knowledge systems that think with you.

You’re now ready to go beyond this manual — to design your own ontologies, connect with real-world data, and reason over complex domains. The next step? Start building.

Good luck, and happy framing!

---

**End of the Beginner’s Manual on F-Logic with ErgoAI**