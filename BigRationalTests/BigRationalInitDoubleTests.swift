import BigInt
@testable import BigRational
import XCTest

class BigRationalInitDoubleTests: XCTestCase {
    func testInitDouble() {
        let double: Double = 112_378_347_834.23783467834
        guard let bigRational = BigRational(double) else { return XCTFail("Unable to convert to Double") }
        XCTAssertEqual(String(double), bigRational.asDecimalString(precision: 11))
    }

    func testInitNegativeDouble() {
        let double: Double = -123.3333333333333333
        guard let bigRational = BigRational(double) else { return XCTFail("Unable to convert to Double") }
        XCTAssertEqual(String(double), bigRational.asDecimalString(precision: 16))
    }
}
