# Foras Vision

Foras is a modern reimagining of the Forth programming language, designed to preserve the elegance and minimalism of stack-based programming while embracing the power of contemporary language features and hardware acceleration.

Where classic Forth emphasizes minimal abstraction and direct control, Foras aims to elevate those principles into a language that can:
- Compile to fast, low-level LLVM IR
- Seamlessly support typed and untyped values
- Operate concurrently across multiple cores or compute engines
- Load modular word sets as versioned, introspectable bundles
- Serve as both a scripting and compilation target language

## Philosophy

Foras is not a reinvention—it is a respectful extension. It remains word-centric and stack-driven. But by layering optional types, closures, hygienic macros, and modern concurrency primitives, Foras enables expressive code without sacrificing transparency or control.

The core ideas:
- **Conversation as code**: Programming should feel like a fluid exchange between the author and the language.
- **Optional structure**: Programmers can opt into types, docs, and concurrency hints—but aren’t forced.
- **Context over ceremony**: Namespaces and modules behave like linguistic context, not boilerplate.
- **IR-native**: Foras is designed to emit structured intermediate representation suitable for CPU, GPU, or parallel execution.
- **Modern minimalism**: Stay small in spirit, but scalable in reach.

## Applications

Foras is initially designed to support bioinformatics exploration, especially for projects like reimplementing Rosalind problem solutions. Long term, it is intended to serve as a lightweight systems or language prototyping tool, and possibly as a host language for real-time synthesis, embedded experimentation, and high-performance graph-based computation.

## Naming

"Foras" is Latin for "forth," representing both a nod to the language’s heritage and a statement of intent: we are going forward.

