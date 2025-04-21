# Foras Language Features

## 1. Typed Words (Optional)
Words can declare type information via stack comments:

```forth
: square ( Float -- Float ) dup * ;
```

This information becomes usable by the compiler:
- Enables runtime checks in debug mode
- Informs IR emission (e.g., `fmul` for floats vs `imul` for ints)
- Supports documentation, tooling, and introspection

If no type comment is provided, behavior defaults to traditional Forth (typeless).

## 2. Closure-Based Word Definitions
Each word in Foras is implemented as a closure backed by a `Word` struct. This enables:
- Clean encapsulation
- Easy redefinition and replacement
- Storage of documentation, stack effects, and other metadata

## 3. Namespace Contexts (Bundles)
Bundles are stack-loadable, versioned modules of words and types:

```forth
use bio.kmer
kmerize build-graph end-use
```

- Eliminates repetitive namespace prefixes
- Reduces name collision risk
- Enables versioning, documentation, and introspection of word sets

## 4. Self-Documenting Words
Each word may contain:
- A docstring
- A stack signature
- Tags or categories
- Source location or bundle of origin

Interactive commands:
```forth
' kmerize doc
' normalize sig
' sort deps
```

## 5. Hygienic Macros
Macros behave like quoted syntax transformers, expanding into safe, context-aware Forth:

```forth
match
  ( Int ) ( dup 0 < ) [ "neg" . ]
  ( Int )              [ "pos" . ]
endmatch
```

- Avoid name collisions
- Support local bindings and expansion hygiene
- Allow user-defined control flow constructs

## 6. Concurrency as a First-Class Feature
```forth
[ task-a ] spawn
[ task-b ] spawn
wait-all
```

Each spawned task gets its own:
- Data and return stack
- VM instance (shared or shadowed dictionary)

Future extensions:
- Channels (`chan.send`, `chan.recv`)
- Futures, join handles, task cancellation
- Fiber-style scheduling

## 7. IR-Native Language Design
Foras is designed to emit optimized IR blocks suitable for:
- LLVM vector and scalar targets
- GPU compute kernels (Metal, OpenCL)
- Multicore SIMD execution

## 8. Stack-Based Macro Expansion and Scoping
Macro execution obeys stack order and lexical scoping:
- Context defines namespace resolution
- Scoped `use ... end-use` reduces noise
- Bundle context acts like a conversational scope ("you’re in the bio room")

## 9. Modular Introspection and Debugging
The VM supports reflection over all defined words:
- List all words in a bundle
- Search by tag or signature
- Trace call graphs and stack effects

## 10. Stack-Loadable Modules
Modules are not just source files, but structured, introspectable units:
```forth
load-bundle "bio.kmer"
```
- Includes namespace, version, words, types, and dependencies
- Safe to unload, inspect, alias, and version-fork
- Enable contextual scoping and live patching

