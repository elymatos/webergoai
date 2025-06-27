### Part II — Thinking Smarter: Advanced Reasoning in F-Logic

#### Chapter 9 — Changing Your Mind: Nonmonotonic Reasoning

##### What This Chapter Covers

In this chapter, we explore **nonmonotonic reasoning** — the ability to revise beliefs when new information becomes available. Unlike classic logic, where adding facts only adds conclusions, nonmonotonic logic allows us to **retract** earlier inferences based on new knowledge.

##### What is Nonmonotonic Reasoning?

In **monotonic** logic (like standard Prolog), if something is true, it stays true no matter what else you add. But in real life:

- We assume Tweety can fly — until we learn Tweety is a penguin.
    
- We believe a room is empty — until someone walks in.
    

F-Logic supports this more natural style of reasoning.

##### Defaults and Revisions

Let’s say:

```prolog
bird::animal.
bird[ flies -> true ].
```

Now we assume all birds fly. But:

```prolog
penguin:bird[ flies -> false ].
tweety:penguin.
```

ErgoAI now concludes: Tweety **does not** fly — overriding the default.

##### How This Works

Nonmonotonic inference is made possible by:

- **Inheritance with exceptions** (specific beats general)
    
- **Negation as failure** (`not(...)` tests failure to prove something)
    
- **Rule ordering** and **priority**
    

##### Use Case: Medical Diagnosis

```prolog
has_fever(P) :- P[ temperature -> T ], T > 37.5.
has_flu(P) :- has_fever(P), not(P[ tested_negative -> flu ]).
```

This says: If someone has a fever and hasn't tested negative, we assume flu — until we learn otherwise.

##### Combining Rules and Exceptions

You can layer knowledge:

```prolog
flies(X) :- X:bird, not(X[ flies -> false ]).
```

This uses negation-as-failure to treat lack of contrary evidence as support for the default.

##### Practical Tips

- Be careful when mixing defaults with rules: clarity is more important than cleverness.
    
- Use `not(...)` to signal assumptions you are willing to retract.
    
- Make sure specific rules override general ones.
    

##### Recap

- Nonmonotonic logic models real-world uncertainty and exceptions.
    
- Defaults can be overridden by specific facts.
    
- Negation-as-failure allows assumptions.
    
- ErgoAI’s logic supports dynamic, layered reasoning.
    

---

#### Chapter 10 — Modules, Scoping, and Namespaces

##### What This Chapter Covers

As F-Logic projects grow, it's important to keep your knowledge organized. This chapter introduces **modules**, **namespaces**, and **scoping** — tools that help structure your logic and avoid naming collisions.

##### Why Use Modules?

Imagine you're working with two systems:

- One tracks `person[ name -> ... ]` for employees.
    
- Another uses `person[ name -> ... ]` for social network users.
    

Without modules, these could conflict. Modules allow you to isolate and reuse logic safely.

##### Declaring a Module

Each ErgoAI file can declare a module:

```prolog
:- module(company).
```

This means all facts and rules are in the `company` namespace.

Another file could declare:

```prolog
:- module(social).
```

Now both `company::person` and `social::person` can exist independently.

##### Using Other Modules

You can import another module with:

```prolog
:- use_module(social).
```

This lets you use its symbols explicitly:

```prolog
social::user[ name -> "Alice" ].
```

##### Local vs Global Scope

By default, terms are local to their module. To refer to an object globally, you use the module prefix:

```prolog
company::bob[ role -> manager ].
social::bob[ friend_of -> alice ].
```

Even though both are named `bob`, they refer to distinct individuals in different contexts.

##### Exporting and Hiding

You can control what gets exported:

```prolog
:- export(employee/1).
```

Only declared exports can be used by other modules. This improves encapsulation.

##### Practical Tips

- Use modules to isolate parts of a large model.
    
- Prefix external symbols when clarity is needed.
    
- Prefer local reasoning, and only reach across modules when justified.
    
- Keep module files small and focused.
    

##### Recap

- Modules provide namespaces to separate logic.
    
- Use `:- module(...)` and `:- use_module(...)` for modular design.
    
- Prefix with `mod::` to access specific terms.
    
- Exports control what’s visible to other modules.
    

---

#### Chapter 11 — Changing the World: Updates and State Transitions

##### What This Chapter Covers

So far, F-Logic has felt very declarative — like a frozen snapshot of knowledge. But real applications need change: booking a flight, moving an item, modifying a user profile. This chapter introduces **updates**, **state transitions**, and how ErgoAI manages changes in the knowledge base.

##### From Facts to Actions

In ErgoAI, you can **assert**, **retract**, and **update** facts dynamically using special commands.

##### Adding Facts Dynamically

You can insert facts at runtime:

```prolog
:- assert(alice[ location -> paris ]).
```

This adds a new fact to the knowledge base.

##### Removing Facts

To remove a fact:

```prolog
:- retract(alice[ location -> paris ]).
```

This removes the slot assignment for `alice`.

##### Replacing a Value

To update a slot:

```prolog
:- update(alice[ location -> paris ], alice[ location -> london ]).
```

This is a shortcut for retracting the old and asserting the new.

##### Transactions and State Blocks

You can group updates into atomic blocks:

```prolog
:- begin_transaction.
:- retract(alice[ location -> paris ]).
:- assert(alice[ location -> rome ]).
:- end_transaction.
```

If any part fails, the transaction can be rolled back.

##### Triggers and Effects

You can define **update rules** that react to changes:

```prolog
:- on_assert(employee[ salary -> S ]) :- 
    ( S < 0 -> error("Invalid salary") ; true ).
```

This protects your model from invalid data.

##### Temporal Modeling

You can model change over time:

```prolog
bob[ has_status -> busy @ time(10:00) ].
```

Or track history:

```prolog
:- assert(log[bob, moved_to, london, at(2025-06-01)]).
```

##### Practical Tips

- Use `assert`, `retract`, and `update` to modify the KB.
    
- Prefer transactional updates when consistency is needed.
    
- Track history with explicit time or event annotations.
    
- Use update rules for validation and automation.
    

##### Recap

- ErgoAI supports dynamic updates and state modeling.
    
- Changes can be transactional and rule-triggered.
    
- The knowledge base is not static — it's a living model.
    

---

#### Chapter 12 — Keeping It Together: Integrity Constraints and Repair

##### What This Chapter Covers

What happens when things go wrong? In this final chapter of Part II, we’ll learn how to use **integrity constraints** to prevent inconsistencies and how to **repair** a knowledge base that violates its own rules.

##### What are Integrity Constraints?

These are conditions that must always hold true — like database constraints. If violated, ErgoAI can:

- Reject updates
    
- Trigger error messages
    
- Attempt automatic repair
    

##### Examples of Constraints

Require that all employees have a department:

```prolog
employee[ department -> D ] :- nonvar(D).
```

Or more formally:

```prolog
:- constraint employee[ department -> _ ].
```

This triggers a warning if any `employee` lacks a `department`.

##### Cardinality Violations

If you declare:

```prolog
person[ has_name => {1..1 string} ].
```

And later insert:

```prolog
alice[ has_name -> "Alice", has_name -> "Alicia" ].
```

This violates the 1..1 cardinality and will raise an error.

##### Functional Dependencies

You can enforce that a slot behaves like a function:

```prolog
:- functional(person, has_name).
```

Now a person can only have one name.

##### Referential Constraints

You can check that referenced objects exist:

```prolog
:- constraint student[ enrolled_in -> C ] => C:course.
```

This ensures that every `C` in `enrolled_in` must actually be a `course`.

##### Repair Strategies

ErgoAI may suggest or attempt:

- Removing offending facts
    
- Replacing bad values with defaults
    
- Flagging the object for manual review
    

You can also write custom repair logic:

```prolog
:- on_violation(employee[ department -> D ]) :- 
    ( var(D) -> assign_default_department ; true ).
```

##### Design Philosophy

Use constraints to:

- Keep your model safe
    
- Detect errors early
    
- Guide the evolution of knowledge
    

##### Recap

- Integrity constraints enforce structure and consistency.
    
- Violations can be handled manually or automatically.
    
- Repairs help recover from broken states.
    
- A healthy knowledge base keeps its promises.
    

---

This concludes **Part II** of the F-Logic Beginner’s Manual. Ready to move on to **Part III: Practical Patterns and Best Practices**?