import Foundation

struct AddWord: Word, Sendable {
    let name = "+"

    func execute(on vm: ForasVM) {
        guard let b = vm.popInt(),
              let a = vm.popInt() else {
            print("Stack underflow on '+'")
            return
        }
        vm.push(a + b)
    }

    func emitIR(to builder: IRBuilder) {
        builder.emitAdd()
    }
}
