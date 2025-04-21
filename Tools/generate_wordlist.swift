// Tools/generate_wordlist.swift
// Run this script to generate Sources/Foras/CoreWords/AllCoreWords.swift

import Foundation

let coreWordsPath = "Sources/Foras/CoreWords"
let outputFile = URL(fileURLWithPath: coreWordsPath + "/AllCoreWords.swift")

let fileManager = FileManager.default
guard let files = try? fileManager.contentsOfDirectory(atPath: coreWordsPath) else {
    fatalError("Failed to read CoreWords directory.")
}

let wordTypes = files
    .filter { $0.hasSuffix(".swift") && $0 != "AllCoreWords.swift" }
    .map { $0.replacingOccurrences(of: ".swift", with: "") }
    .sorted()

let header = """
// Auto-generated file. Do not edit directly.

let allCoreWords: [Word] = [
"""

let body = wordTypes.map { "    \($0)()," }.joined(separator: "\n")
let footer = "]\n"

let fullSource = header + body + "\n" + footer

// Write the generated file
do {
    try fullSource.write(to: outputFile, atomically: true, encoding: .utf8)
    print("Generated AllCoreWords.swift with \(wordTypes.count) words.")
} catch {
    print("Failed to write AllCoreWords.swift: \(error)")
}
