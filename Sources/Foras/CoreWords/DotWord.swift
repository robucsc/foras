public struct DotWord: Word, Sendable {
    public let name = "."

    public func execute(on vm: ForasVM) {
        if let val = vm.popAny() {
            if let printable = val as? CustomStringConvertible {
                print(printable.description)
            } else {
                print("<?>")  // fallback for weird types
            }
        } else {
            print("Stack underflow on '.'")
        }
    }

    public func emitIR(to builder: IRBuilder) { }
}
