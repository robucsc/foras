import Foundation

/// Protocol representing a Forth word in Foras.
/// Each word can be executed immediately, or compiled to IR.
public protocol Word: Sendable {
    var name: String { get }

    /// Executes the word on the live VM stack.
    func execute(on vm: ForasVM)

    /// Emits IR representing this word’s logic.
    /// Stub for now; we’ll fill in real IR later.
    func emitIR(to builder: IRBuilder)
}
