import BigInt
@testable import BigRational
import XCTest

class BigRationalEqualityTests: XCTestCase {
    func testEqualsValue() {
        XCTAssertTrue(BigRational(209_832_093_820_938) == BigRational(209_832_093_820_938))
        XCTAssertTrue(BigRational(4.23) == BigRational(4.23))
        XCTAssertTrue(BigRational(4.23) != BigRational(124.23))
        XCTAssertTrue(BigRational(-3) != BigRational(3))
        XCTAssertTrue(BigRational(-3.11111) == BigRational(-3.11111))
    }

    func testGreaterThanValue() {
        XCTAssertTrue(BigRational(209_832_093_820_938) > BigRational(23))
        XCTAssertFalse(BigRational(4.23)! > BigRational(4.23)!)
        XCTAssertFalse(BigRational(4.23)! > BigRational(124.23)!)
        XCTAssertFalse(BigRational(-3) > BigRational(3))
        XCTAssertTrue(BigRational(3) > BigRational(-3))
        XCTAssertTrue(BigRational(-3.11111)! > BigRational(-4.20)!)
    }

    func testGreaterThanOrEqualValue() {
        XCTAssertTrue(BigRational(209_832_093_820_938) >= BigRational(23))
        XCTAssertTrue(BigRational(4.23)! >= BigRational(4.23)!)
        XCTAssertFalse(BigRational(4.23)! >= BigRational(124.23)!)
        XCTAssertFalse(BigRational(-3) >= BigRational(3))
        XCTAssertTrue(BigRational(3) >= BigRational(-3))
        XCTAssertTrue(BigRational(-3.11111)! >= BigRational(-4.20)!)
    }

    func testLessThanValue() {
        XCTAssertFalse(BigRational(209_832_093_820_938) < BigRational(23))
        XCTAssertFalse(BigRational(4.23)! < BigRational(4.23)!)
        XCTAssertTrue(BigRational(4.23)! < BigRational(124.23)!)
        XCTAssertTrue(BigRational(-3) < BigRational(3))
        XCTAssertFalse(BigRational(3) < BigRational(-3))
        XCTAssertFalse(BigRational(-3.11111)! < BigRational(-4.20)!)
    }

    func testLessThanOrEqualValue() {
        XCTAssertFalse(BigRational(209_832_093_820_938) <= BigRational(23))
        XCTAssertTrue(BigRational(4.23)! <= BigRational(4.23)!)
        XCTAssertTrue(BigRational(4.23)! <= BigRational(124.23)!)
        XCTAssertTrue(BigRational(-3) <= BigRational(3))
        XCTAssertFalse(BigRational(3) <= BigRational(-3))
        XCTAssertFalse(BigRational(-3.11111)! <= BigRational(-4.20)!)
    }
}
