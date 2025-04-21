import XCTest
@testable import Foras

final class ForasTests: XCTestCase {
    func testAddWord() {
        let vm = ForasVM()
        vm.evaluate("2 3 +")
        let result: Int? = vm.pop()
        XCTAssertEqual(result, 5)
    }
}
