// Foras/ForasVM.swift

import Foundation

public class ForasVM {
    internal var stack: [Any] = []
    private var dictionary: [String: Word] = [:]

    public func register(_ word: Word) {
        dictionary[word.name] = word
    }

    public init() {
        allCoreWords.forEach(register)
        print("Registered words:", dictionary.keys.sorted()) 
    }

    // public func evaluate(_ code: String) {
    //     let tokens = code.split(separator: " ").map(String.init)
    //     for token in tokens {
    //         if let word = dictionary[token] {
    //             word.execute(on: self)
    //         } else if let number = Int(token) {
    //             stack.append(number)
    //         } else {
    //             print("Unknown word: \(token)")
    //         }
    //     }
    // }
    
    public func evaluate(_ code: String) {
    let tokens = code
    .split(whereSeparator: \.isWhitespace)
    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    print("Evaluating tokens:", tokens) // 👈 Add this line
    for token in tokens {
        if let word = dictionary[token] {
            word.execute(on: self)
        } else if let number = Int(token) {
            stack.append(number)
        } else {
            print("Unknown word: \(token)")
        }
    }
}

    public func runFile(atPath path: String) {
        do {
            let source = try String(contentsOfFile: path, encoding: .utf8)
            evaluate(source)
        } catch {
            print("Failed to load file: \(error)")
        }
    }
} 
