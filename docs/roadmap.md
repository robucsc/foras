# Foras Project Roadmap

## ✅ Initial Setup (Completed)
- Project directory structure
- `Sources/`, `Tests/`, and `docs/` initialized
- Word files moved into `CoreWords/`
- Vision and feature documentation created

## 🛠️ Active Development
### In Progress
- [ ] List comprehension-based core word registration (`AllCoreWords.swift`)
- [ ] Git initialization and GitHub setup
- [ ] Commit message system (`message.txt`)

### Core Word System
- [ ] Define `Word` protocol (done)
- [ ] Implement and register initial core words (`+`, `.`, `dup`, etc.)
- [ ] Add metadata fields (doc, sig, etc.) to `Word`
- [ ] Create auto-registration script for `CoreWords/`

### Stack and VM
- [ ] Finalize `ForasVM` structure
- [ ] Implement safe stack helpers (`popInt`, `peek`, etc.)
- [ ] Add error handling for underflows and type mismatches

## 🔜 Short-Term Goals
- [ ] Implement and test introspection commands (`doc`, `sig`, `deps`)
- [ ] Add stack effect parser for typed comments
- [ ] Add simple word redefinition tracking/versioning system
- [ ] Implement `use` and `end-use` for namespace context

## 💡 Medium-Term Features
- [ ] Add basic hygienic macro support
- [ ] Create `spawn` and `wait-all` for concurrency
- [ ] Start implementing Foras IR structs
- [ ] Emit basic LLVM IR from `emitIR(to:)`
- [ ] Support `map`/`gpu-map` with detection-based dispatch

## 📦 Bundles and Modularity
- [ ] Define `Bundle` type and structure
- [ ] Implement `load-bundle`, `unload-bundle`, and bundle introspection
- [ ] Allow bundle-level versioning and namespacing
- [ ] Add `alias`, `import`, and context-aware resolution

## 🧪 Testing and Tooling
- [ ] Per-word tests
- [ ] Bundle-level test sets
- [ ] `test-all` runner word
- [ ] Build script to validate documentation consistency

## 🚀 Stretch Goals
- [ ] Parallel map and reduce words for GPU/CPU
- [ ] Channel-based message passing (`chan.send`, `chan.recv`)
- [ ] Support for user-defined structs and composite types
- [ ] IDE integration (Codium extension?)
- [ ] Generate `.ll` or `.bc` files for LLVM toolchain

---

This file will be updated regularly as milestones are reached or reprioritized.

