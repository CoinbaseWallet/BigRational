import BigInt
@testable import BigRational
import XCTest

class BigRationalInitStringTests: XCTestCase {
    func testStringInitWithDecimal() {
        let expectedValue = "1300,34"
        let bigRational = BigRational(expectedValue, decimalSeparator: ",")
        let actualValue = bigRational?.asDecimalString(precision: 2, decimalSeparator: ",")

        XCTAssertEqual(expectedValue, actualValue)
    }

    func testStringInitWithDecimalWithEndingDecimal() {
        let expectedValue = "20"
        let bigRational = BigRational("20.", decimalSeparator: ".")
        let actualValue = bigRational?.asDecimalString(precision: 2, decimalSeparator: ".")

        XCTAssertEqual(expectedValue, actualValue)
    }

    func testStringInitWithDecimalWithEndingDecimal2() {
        let expectedValue = "0"
        let bigRational = BigRational("0.", decimalSeparator: ".")
        let actualValue = bigRational?.asDecimalString(precision: 2, decimalSeparator: ".")

        XCTAssertEqual(expectedValue, actualValue)
    }
}
