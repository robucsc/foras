public struct DupWord: Word, Sendable {
    public let name = "dup"

    public func execute(on vm: ForasVM) {
        if let top = vm.peek() {
            vm.push(top)
        } else {
            print("Stack underflow on 'dup'")
        }
    }

    public func emitIR(to builder: IRBuilder) {
        // No-op for now
    }
}
