### Part I — Getting Comfortable with F-Logic

#### Chapter 1 — Meet the Frame Family: Objects and Attributes

##### What This Chapter Covers

This is your first real step into Frame Logic. We'll start with the basics: how to represent **things** in the world and describe what they **know or contain**. If you've ever used a spreadsheet, a JSON file, or classes in Python or Java, you'll recognize some patterns.

##### Say Hello to Objects

In F-Logic, an **object** is something that has properties (or _slots_) and values.

Let's say we want to represent a person named Alice who lives in Paris and speaks English. In natural language, you'd write:

> Alice is a person. Alice lives in Paris. Alice speaks English.

In F-Logic, you could write:

```prolog
alice:person[ lives -> paris, speaks -> english ].
```

Let’s break it down:

- `alice` is the object.
    
- `:person` means Alice is an instance of the class `person`.
    
- The square brackets `[]` contain **slot-value pairs**.
    
- `lives -> paris` means the `lives` slot has the value `paris`.
    
- `speaks -> english` means the `speaks` slot has the value `english`.
    

##### Multiple Slots and Multi-Valued Properties

What if Alice speaks more than one language?

```prolog
alice:person[ lives -> paris, speaks -> {english, french} ].
```

The braces `{}` indicate a _set_ of values. This tells ErgoAI that `speaks` is **multi-valued**.

##### Creating New Objects and Classes

You can introduce a new class and use it immediately:

```prolog
book:object[ title -> "ErgoAI Guide", author -> alice ].
```

This defines `book` as an object with a `title` and an `author`. Notice that `alice` (an object) is now used as a value—objects can reference other objects!

##### Visualizing the Frame

Think of a frame like a table:

|Object|Class|lives|speaks|
|---|---|---|---|
|alice|person|paris|{english, french}|

##### Recap

- Objects are instances of classes.
    
- Slots describe properties.
    
- Values can be single items or sets.
    
- You can describe relationships between objects easily.
    

---

#### Chapter 2 — Drawing the Family Tree: Classes and Subclasses

##### What This Chapter Covers

In this chapter, we explore how to define **class hierarchies**, organize knowledge using **inheritance**, and express generalizations in your F-Logic models.

##### Class Basics

We already used `alice:person`. That means Alice is an **instance** of the class `person`.

We can declare `person` as a class explicitly:

```prolog
person::class.
```

You can then add **default slot types** to the class:

```prolog
person[ lives => string, speaks => {0..* string} ].
```

This means: any instance of `person` may have these slots with these types.

##### Subclasses: The `::` Operator

To define that a student is a kind of person:

```prolog
student::person.
```

Now anything true for a `person` is also true for a `student`, unless overridden.

##### Inheritance in Action

Suppose we write:

```prolog
bob:student[ lives -> rome ].
```

ErgoAI will know that `bob` is also a `person`, thanks to the subclass relationship.

You can chain inheritance:

```prolog
student::person.
graduate_student::student.
```

Then `alice:graduate_student` inherits all properties of a person and a student.

##### Class Slot Constraints

Define slots and expected types:

```prolog
person[ speaks => {0..* string} ].
student[ enrolled_in => {1..* course} ].
```

This helps validate objects and control structure.

##### Recap

- Classes define templates for objects.
    
- Subclasses inherit slots and constraints.
    
- `::` expresses subclass and class membership.
    
- Use constraints to model expectations and rules.
    

---

#### Chapter 3 — Facts and Queries: Asking the Knowledge Base

##### What This Chapter Covers

Now that we have objects and classes, let’s learn how to **ask questions** and **retrieve answers**. This is how we interact with our F-Logic knowledge base.

##### Querying Slot Values

Let’s say we’ve declared:

```prolog
alice:person[ lives -> paris, speaks -> {english, french} ].
```

We can ask:

```prolog
?- alice[ lives -> X ].
```

ErgoAI will respond:

```
X = paris.
```

##### Querying Multi-Valued Slots

```prolog
?- alice[ speaks -> Lang ].
```

Returns:

```
Lang = english ;
Lang = french.
```

ErgoAI finds each value in the set and returns them one by one.

##### Using Variables in Queries

Variables (starting with uppercase) let you generalize:

```prolog
?- P[ lives -> paris ].
```

This asks: _Who lives in Paris?_ It will return any matching `P`.

##### Chained Slot Queries

You can chain slots:

```prolog
book[ author -> A ], A[ lives -> paris ].
```

This means: _Find books whose author lives in Paris._

##### Multiple Conditions

Use commas to express conjunction:

```prolog
?- P[ lives -> paris, speaks -> french ].
```

This finds people who live in Paris **and** speak French.

##### Wildcard Queries

Use `_` for anonymous variables:

```prolog
?- alice[ speaks -> _ ].
```

This simply checks if she speaks anything, without caring what.

##### Recap

- Use queries to extract slot values and object relationships.
    
- Variables make queries reusable and powerful.
    
- Multiple conditions = logical AND.
    
- Use `_` for don't-care values.
    

---

#### Chapter 4 — Things That Vary: Multi-Valued Slots and Sets

##### What This Chapter Covers

Some properties in the real world aren't simple. A person can speak several languages, a recipe can have many ingredients, and a course might be taught by more than one professor. This chapter introduces **multi-valued slots**, **sets**, and how to work with them in ErgoAI.

##### Defining Multi-Valued Slots

We’ve seen this before:

```
alice:person[ speaks -> {english, french} ].
```

This means that `alice` has more than one value in the `speaks` slot. In F-Logic, this is represented as a **set** using curly braces `{}`.

##### Querying Set Values

You can query set membership just like before:

```
?- alice[ speaks -> X ].
```

returns:

```
X = english ;
X = french.
```

Even though the `speaks` slot holds a set, ErgoAI matches against each value in the set.

##### Asserting Sets with Constants or Variables

Sets can contain other objects or literals:

```
bob:student[ enrolled_in -> {math101, hist202, phil303} ].
```

Or variables:

```
?- bob[ enrolled_in -> Course ].
```

ErgoAI will bind `Course` to each element of the set.

##### Order Doesn’t Matter (It’s a Set!)

Remember that the order of values in a set does not matter:

```
{a, b} = {b, a}.
```

This is different from a list or a tuple. Sets are **unordered collections of distinct elements**.

##### Working with Empty Sets

Sometimes a slot may be empty:

```
carol:person[ speaks -> {} ].
```

This explicitly says Carol speaks nothing—or that the knowledge is currently empty. You can test this with:

```
?- carol[ speaks -> {} ].
```

##### Cardinality Constraints

You can control how many values a slot can have:

```
person[ speaks => {0..*} ]  % zero or more
course[ taught_by => {1..3} ]  % between 1 and 3 instructors
```

This allows you to describe expected structure more precisely.

##### Checking Set Size (Advanced)

In advanced rules or constraints, you can check how many elements a set has using built-in functions, but we’ll get there later. For now, just remember that a set is not a list—and duplicates are automatically removed.

##### Recap

- Slots can be **multi-valued** using sets.
    
- Sets are written with `{}` and support multiple values.
    
- Queries work the same way—they iterate over the values.
    
- You can constrain how many values are expected per slot.
    

---
#### Chapter 5 — Rules of the Game: Defining Inference

##### What This Chapter Covers

This chapter introduces **rules** — the engine that powers intelligent reasoning in ErgoAI. You’ll learn how to use logical inference to derive new knowledge from existing facts and how to structure rules that look and feel like natural conclusions.

##### Rules: The Heart of Reasoning

Let’s say we want to infer that someone is multilingual:

```
multilingual(P) :- P[ speaks -> {_, _|_} ].
```

This means: if `P` speaks more than one language, then `P` is multilingual.

A simpler rule:

```
bilingual(P) :- P[ speaks -> {A, B} ].
```

You can think of this like:

> If someone speaks A and B, then they are bilingual.

##### Rule Syntax

Rules look like this:

```
conclusion :- condition1, condition2, ..., conditionN.
```

Each condition must be satisfied for the conclusion to hold.

##### Inferred Slots

You can define new slots using rules:

```
X:person[ language_count -> N ] :- 
    X[ speaks -> S ], 
    set::size(S, N).
```

This rule introduces a derived property called `language_count`.

##### Chaining Rules

Rules can refer to other inferred facts:

```
fluent(P) :- P[ language_count -> N ], N >= 3.
```

This builds on the previous rule — a fluent person is one who speaks 3 or more languages.

##### Safe Variables

Every variable in the **head** (left side) of a rule must appear in the **body** (right side). For example, this is _not_ allowed:

```
has_friends(X) :- Y[ friend_of -> X ].  % invalid: X appears only in the head
```

But this is fine:

```
has_friends(X) :- X[ friend_of -> Y ].
```

##### Avoiding Loops

ErgoAI handles recursion, but care is needed to avoid infinite inference loops. Later chapters will explain recursion strategies in detail.

##### Recap

- Rules allow inference of new facts.
    
- Use `:-` to define conditions that imply a conclusion.
    
- You can define new slot values dynamically.
    
- Rules can be chained and composed.
    
- Be careful to keep all variables safe.
    

---

#### Chapter 6 — Defaults, Negation, and Exceptions

##### What This Chapter Covers

Real-world knowledge isn’t always black and white. People typically have a nationality, **unless** they are stateless. Most birds fly, **but** penguins don’t. This chapter explores how to use **defaults**, **negation**, and **exceptions** in ErgoAI.

##### Defaults: What Happens Normally

You can define default values that apply unless something contradicts them.

```
bird::animal.
bird[ flies -> true ].
```

Now all birds are assumed to fly. This acts as a _default_ — it can be overridden.

```
penguin:bird[ flies -> false ].
```

This explicitly overrides the default inherited from `bird`.

##### Closed-World Assumption (CWA)

By default, ErgoAI uses a **closed-world assumption** for facts: if something is _not known_, it is assumed _false_.

So if you ask:

```
?- emu[ flies -> true ].
```

and there’s no information about `emu`, ErgoAI will answer _no_.

##### Open-World Slots

You can declare a slot to use **open-world** reasoning:

```
bird[ color => open string ].
```

This tells ErgoAI not to assume that lack of color information means the bird has no color.

##### Classical Negation vs. Negation as Failure

You can say something is explicitly false:

```
penguin[ flies -> false ].  % Classical negation (it's a fact)
```

Or you can **test for absence**:

```
not( X[ flies -> true ] ).  % Negation as failure
```

This is true when ErgoAI **fails to prove** that X can fly.

##### Exceptions and Overrides

You can define exception rules:

```
flies(X) :- X:bird, not(X:penguin).
```

This says: birds fly **unless** they are penguins.

You can also write more general overrides:

```
X:bird[ flies -> true ] :- not(X[ flies -> false ]).
```

This means: assume birds fly unless told otherwise.

##### Recap

- Defaults allow general rules with exceptions.
    
- Negation can mean _absence of proof_ or _explicit falsity_.
    
- Use `not(...)` to test what cannot be proven.
    
- Closed-world logic assumes false unless known true.
    
- Open-world logic leaves facts undefined until proven.
    

---
#### Chapter 7 — Constraints and Slot Validation

##### What This Chapter Covers

Constraints allow you to specify rules about what _should_ be true in your data. This helps catch errors, enforce consistency, and define a clear structure for your knowledge base.

##### What is a Constraint?

A constraint is a rule that **must** be satisfied for the knowledge base to be considered valid. If any constraint is violated, ErgoAI can signal an error or reject the model.

##### Type Constraints

You can constrain what _type_ of values a slot may have:

```
person[ speaks => {0..* string} ].
```

This means the `speaks` slot must contain a set of zero or more strings.

##### Cardinality Constraints

Cardinality controls **how many values** are expected:

```
person[ has_name => {1..1 string} ].
```

This means every person must have exactly one name.

Another example:

```
course[ taught_by => {1..3 professor} ].
```

Each course must be taught by **at least one** and **no more than three** professors.

##### Structural Constraints

You can require that certain slots must exist:

```
student[ enrolled_in => {1..* course} ].
```

This enforces that a student must be enrolled in **at least one** course.

##### Custom Validation Using Rules

Sometimes you want to check values using custom logic:

```
valid_email(E) :- string::matches(E, ".+@.+\..+").
person[ email -> E ] :- valid_email(E).
```

This rule checks that email addresses follow a basic pattern.

##### Detecting Constraint Violations

ErgoAI can automatically detect and report violations of declared slot constraints. This makes your model safer and more predictable.

##### Using Constraints as Documentation

Constraints not only protect your model — they also **document your expectations**. Anyone reading your class declarations can understand what’s valid, required, optional, and restricted.

##### Recap

- Constraints define what values are valid.
    
- Use types, cardinality, and structure to enforce consistency.
    
- Custom constraints can be defined using rules.
    
- Constraints help prevent errors and document your model.
    

---
#### Chapter 8 — Talking to the World: Databases and External Sources

##### What This Chapter Covers

F-Logic isn't just about isolated facts — it’s also about **interfacing** with external systems: SQL databases, JSON APIs, RDF graphs, and more. This chapter introduces how ErgoAI connects to the outside world and turns real data into logic facts.

##### Why Talk to External Sources?

You might want to:

- Load employee data from a corporate database
    
- Query a list of sensors from a smart building API
    
- Check currency exchange rates from a remote service
    

##### External Predicates

External predicates are marked with a prefix, usually in a module:

```
:- use_module(sql).
```

Then you can write something like:

```
sql::query("SELECT name FROM employees", Name).
```

This runs a live SQL query and binds the result to `Name`.

##### Importing Data as Facts

You can **import** data from CSVs or relational tables:

```
:- import("employees.csv", employee).
```

This will populate facts like:

```
employee[ name -> "Alice", dept -> "HR" ].
```

##### Wrapping APIs

You can call web services and convert the result into facts using ErgoAI’s API support. For instance:

```
http::get("http://api.weather.com/paris", JSON),
json::extract(JSON, temperature, T).
```

##### Live Queries and Reactivity

ErgoAI can be configured to poll or react to changing data sources. This lets you build **smart agents** that track and reason over evolving facts in real time.

##### Example: Weather-Based Rules

```
weather[ city -> paris, temperature -> T ] :-
    http::get("/paris-weather", J),
    json::extract(J, temperature, T).

is_hot(City) :- weather[ city -> City, temperature -> T ], T > 30.
```

This defines `is_hot(City)` based on live weather data.

##### Recap

- ErgoAI can query SQL, CSV, JSON, and RDF data.
    
- External predicates bridge logic and the real world.
    
- You can wrap APIs and databases into logic-based reasoning.
    
- Real-time logic becomes possible with dynamic facts.
    

---

That concludes **Part I**. In Part II, we’ll level up by exploring **nonmonotonic reasoning**, **modularity**, **updates**, and **integrity checking** — the real tools of the F-Logic master!