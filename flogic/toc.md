
## 📘 _“Frame Logic for Humans”_ — Beginner’s Guide to ErgoAI

### 🧭 **Introduction**

- What Is F-Logic, and Why Should You Care?
    
- What Makes ErgoAI Different?
    
- Logic Programming vs. Frame Logic
    
- How This Manual Is Structured
    
- How to Follow Along (Installing and Running ErgoAI)
    

---

### 📗 **Part I – Getting Comfortable with F-Logic**

> _"Objects, slots, and a dash of logic."_

1. **Meet the Frame Family: Objects and Attributes**
    
    - The `::` and `:` operators
        
    - Creating your first object
        
    - Slot-value pairs and inheritance
        
2. **It’s All in the Family: Classes and Subclasses**
    
    - `subclass-of` and how inheritance works
        
    - Class hierarchy and type checking
        
    - Multiple inheritance: is it scary?
        
3. **Talking About the World: Facts and Queries**
    
    - Stating facts in F-Logic
        
    - Querying: the `?-` operator
        
    - Navigating object structures with dot and bracket notation
        
4. **Things That Vary: Multi-valued Slots and Sets**
    
    - Using `{}` for sets
        
    - Cardinality of slots
        
    - When one value just isn’t enough
        

---

### 📘 **Part II – Adding Intelligence**

> _"From storage to smart logic."_

5. **Rules of the Game: Defining Inference**
    
    - `:-` rules: if-then reasoning
        
    - Variables and unification
        
    - Writing reusable rule patterns
        
6. **When Things Change: Defaults, Negation, and Exceptions**
    
    - Negation as failure
        
    - Default values (`=>`)
        
    - Overrides and non-monotonic reasoning
        
7. **Constraints and Consistency**
    
    - Slot constraints: `range`, `cardinality`, `type`
        
    - Type declarations and schema checking
        
    - Constraint violations and error handling
        

---

### 📙 **Part III – Working with Real Systems**

> _"From small knowledge bases to working applications."_

8. **Modules and Namespaces**
    
    - Why modularize? Scope and encapsulation
        
    - Declaring modules and using imports
        
    - Avoiding naming collisions
        
9. **Databases, Web, and External Sources**
    
    - Integrating external data (SQL, RDF, OWL…)
        
    - Accessing and transforming data on the fly
        
    - Query mapping and use cases
        
10. **Transaction Logic: When Order Matters**
    

- Actions, effects, and change over time
    
- State updates and transactional rules
    
- Undo, rollback, and integrity
    

---

### 📒 **Part IV – Building and Debugging**

> _"Putting it all together."_

11. **Debugging Your Logic**
    

- Tracing and explaining inferences
    
- Common beginner pitfalls
    
- Using ErgoAI’s explanation tools
    

12. **From Idea to Prototype**
    

- A small case study: building a knowledge base
    
- Incremental modeling and testing
    
- Exporting and deploying with ErgoAI
    

---

### 🧪 **Part V – Playground and Beyond**

> _"Play, experiment, and design your own logic apps."_

13. **F-Logic Playground**
    

- Exercises for practice
    
- Mini-projects (e.g., family tree, expert system)
    

14. **Preview: Natural Syntax for Frame Logic**
    

- What if logic looked more like language?
    
- First steps toward our syntax preprocessor
    
