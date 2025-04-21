# Foras Implementation Notes

## Word Representation
Words in Foras are closures wrapped in a struct conforming to the `Word` protocol:

```swift
protocol Word {
    var name: String { get }
    func execute(on vm: ForasVM)
    func emitIR(to builder: IRBuilder)
}
```

Additional metadata fields:
- `doc: String?`
- `sig: StackEffect?`
- `version: String?`
- `tags: [String]?`

This enables:
- Runtime execution
- IR emission
- Introspection and documentation
- Safe redefinition or forking

## Stack Model
Foras uses a two-stack model:
- Data stack (`[Value]`)
- Return stack (`[Value]`)

Each `ForasVM` instance owns its own stacks.

## Value Representation
A unified enum is used to represent all stack values:

```swift
enum Value {
    case int(Int)
    case float(Double)
    case string(String)
    case structValue(name: String, fields: [String: Value])
    case vector([Value])
    case bundle(Bundle)
    // etc.
}
```

Type information is available for runtime checks, IR emission, and optional debugging.

## Dictionary and Registration
Words are registered via a central list (`allCoreWords`) and loaded using:

```swift
func loadCoreWords() {
    allCoreWords.forEach(register)
}
```

Auto-registration script will generate this list by scanning `CoreWords/`.

## IR Generation (planned)
Each word implements `emitIR(to:)`, allowing:
- IR emission for optimized backends
- Support for SIMD, parallel, or GPU operations
- Optional high-level control flow macros

IR will be structured as Foras-level instructions initially, then compiled to LLVM IR.

## Bundles
Bundles are self-contained, versioned units that contain:
- Word definitions
- Optional types or macros
- Documentation metadata
- Namespace context

They are stack-loadable and optionally scoped.

## Introspection
The VM will expose words like:
- `' wordname doc`
- `' wordname sig`
- `' wordname deps`

These query the word object and print or return metadata.

## Concurrency
Each `spawn`ed task gets its own `ForasVM` instance:
- Isolated stacks
- Shared or shadowed dictionary
- Communication via channels (future)

## Namespace Context
Namespace resolution is based on context:
- `use math` or `with bio.kmer ... end` sets the namespace context
- Words resolve relative to the current bundle context
- Conflicts raise an ambiguity error

## Filesystem Structure
- `Sources/Foras/CoreWords/`: individual word files
- `Sources/Foras/Core/`: VM, stack helpers, tokenizer
- `Sources/Foras/Bio/`: domain-specific words
- `Sources/Foras/LLVM/`: IR generation backend
- `docs/`: design notes and project documentation

## Testing (planned)
- Each word can be tested independently
- Bundles may include optional test cases in a `tests/` subdirectory
- Future: test runner word `test-all`

---

This file should be updated as implementation progresses.

