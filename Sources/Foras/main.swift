import Foundation

let vm = ForasVM()
// allCoreWords.forEach(vm.register)

// Example inline code
// let test = "3 4 + ."
// vm.evaluate(test)

// Optional: run a file if passed as a command-line argument
if CommandLine.arguments.count > 1 {
    let path = CommandLine.arguments[1]
    vm.runFile(atPath: path)
}
