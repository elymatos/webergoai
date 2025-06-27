### Part IV — From Theory to Practice

#### Chapter 17 — Transaction Logic: When Order Matters

##### What This Chapter Covers

So far, we’ve treated reasoning as a set of timeless facts and rules. But some tasks happen in **steps**. Some facts must be true **before** others. Some actions are **undoable**. This is the world of **transaction logic** — logic that handles **sequenced operations**.

##### Motivation: Not Everything is Timeless

Imagine modeling:

- A workflow that updates a database
    
- A robot that follows a sequence of actions
    
- A booking system with multiple steps
    

In all these cases, **order matters**.

##### Declarative vs Transactional Logic

Declarative F-Logic says "what is true." Transaction logic says:

- What happens **first**
    
- What must happen **next**
    
- What can be **rolled back**
    

##### Executing Sequences

You can bundle changes into a transaction:

```prolog
:- begin_transaction.
:- assert(reserved(seat42)).
:- assert(payment_pending(alice)).
:- end_transaction.
```

This ensures that if any part fails, nothing is committed.

##### Rollbacks on Failure

You can cancel a transaction if a condition isn’t met:

```prolog
:- begin_transaction.
:- assert(assigned(room101)).
:- (available(room101) -> true ; rollback).
:- end_transaction.
```

This prevents inconsistent states.

##### Ordered Inference

Some rules may only fire **after** others:

```prolog
request_submitted(P) :- user[P], action[P, submit_form].
approval_granted(P) :- request_submitted(P), action[P, approve].
```

Here, `approval_granted(P)` depends on submission first.

##### Modeling State Transitions

Use explicit state markers:

```prolog
state(user42, pending).
:- transition(user42, pending -> approved).
```

Define rules for allowed transitions:

```prolog
can_transition(U, S1 -> S2) :- 
    S1 = pending, S2 = approved, has_permission(U, manager).
```

##### Temporal Reasoning (Optional)

You can model time-sensitive effects:

```prolog
event[ happens_at -> time(10:00), causes -> state(user42, active) ].
```

This enables time-aware logic execution.

##### Practical Use Cases

- Reservation systems
    
- Multi-step validations
    
- Workflow automation
    
- Simulation models
    

##### Recap

- Transaction logic supports step-by-step modeling
    
- Use `begin_transaction` and `rollback` to group operations
    
- Sequence rules explicitly using dependent predicates
    
- Track state and transitions with slot values or rules
    

---

#### Chapter 18 — From Idea to Prototype: Building Your First Application

##### What This Chapter Covers

In this chapter, we’ll walk through a **complete mini-project** in F-Logic using ErgoAI. You’ll see how to turn an idea into a working knowledge base — from defining your domain to querying it.

Let’s model a **Course Enrollment System** step by step.

##### Step 1: Define the Classes

```prolog
student::class[ name => string, enrolled_in => {0..* course} ].
course::class[ code => string, title => string, credits => number ].
```

##### Step 2: Add Sample Data

```prolog
math101:course[ code -> "MATH101", title -> "Calculus I", credits -> 4 ].
cs102:course[ code -> "CS102", title -> "Intro to Programming", credits -> 3 ].

alice:student[ name -> "Alice", enrolled_in -> {math101, cs102} ].
bob:student[ name -> "Bob", enrolled_in -> {cs102} ].
```

##### Step 3: Write Basic Queries

```prolog
?- alice[ enrolled_in -> C ].
?- C[ title -> T ].
```

This returns Alice’s courses and their names.

##### Step 4: Add Inference Rules

```prolog
full_time(S) :- S:student, S[ enrolled_in -> Courses ], set::size(Courses, N), N >= 2.
```

Query:

```prolog
?- full_time(alice).
```

##### Step 5: Add Constraints

```prolog
:- constraint student[ enrolled_in -> {0..5 course} ].
```

This limits students to a maximum of five courses.

##### Step 6: Model a Transaction

```prolog
:- begin_transaction.
:- assert(charlie:student[ name -> "Charlie", enrolled_in -> {math101} ]).
:- end_transaction.
```

##### Step 7: Modularize the System

Split into files:

- `classes.flogic` (class declarations)
    
- `facts.flogic` (students + courses)
    
- `rules.flogic` (logic for full-time, etc.)
    

Use `:- use_module(...)` to compose them.

##### Step 8: Run and Refactor

Test your queries. Add rules like `overloaded(S)` or `shares_course(S1, S2)`. Clean up unused facts. Add comments. Your model is now alive.

##### Bonus: Visualize

Use external tools to render:

- Class diagrams
    
- Enrollment networks
    
- Full-time vs part-time dashboards
    

##### Recap

- Start with a simple domain
    
- Define, query, extend, and modularize
    
- Think in terms of frames and reasoning
    
- You now have a working prototype of a real-world knowledge system
    

---

#### Chapter 19 — Exercises and Projects: The F-Logic Playground

##### What This Chapter Covers

This final chapter gives you the space to **practice** and **play** with what you've learned. These exercises and project ideas will help you solidify key concepts and give you ideas for building your own F-Logic applications.

---

### 🧩 Exercises

#### 1. Family Tree

Model a simple family:

- Define `person` and `has_parent` relationships
    
- Infer `is_ancestor_of(X, Y)`
    
- Query for common ancestors
    

#### 2. Access Control Policy

Define classes like `user`, `resource`, and `permission`, and write rules like:

```prolog
can_access(U, R) :- U:admin.
can_access(U, R) :- U:user, R[ owner -> U ].
```

Add constraints to enforce unique ownership.

#### 3. Company Org Chart

Define employees, departments, and roles. Write rules to:

- Find all subordinates of a manager
    
- Verify that all departments have a head
    
- Detect cycles in reporting structure (if any)
    

#### 4. Smart Calendar

Model events with time slots, participants, and locations. Write rules to:

- Detect overlapping events
    
- Suggest free time slots for meetings
    
- Warn if capacity is exceeded
    

#### 5. Supply Chain Tracker

Model suppliers, items, and shipments. Define temporal updates and rules like:

```prolog
delivered(I) :- shipped(I), not(lost(I)).
```

Add transaction logic for multi-step fulfillment.

---

### 💡 Mini Project Ideas

#### 📚 Library System

Model books, borrowers, loans, and overdue rules. Add reasoning for fines and restrictions.

#### 🧠 Knowledge Graph of Concepts

Build a semantic graph of interrelated ideas (e.g. in biology, philosophy, programming). Use inheritance, sets, and inference.

#### 🏫 Course Planner

Expand on Chapter 18 with electives, prerequisites, and conflicts. Write a rule to detect valid degree plans.

#### 🌎 Travel Recommender

Model locations, user preferences, and events. Write recommendation rules using scoring logic.

---

### 🧠 Tips for Exploration

- Use `not(...)` and `set::size(...)` creatively
    
- Write test blocks to validate expected inferences
    
- Draw diagrams before modeling large domains
    
- Refactor frequently into modules
    

---

##### Final Words

This playground is your launchpad. Explore, experiment, and build systems that model your world — one frame at a time.

Good luck, and happy reasoning!