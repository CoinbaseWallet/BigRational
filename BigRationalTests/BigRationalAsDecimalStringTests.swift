import BigInt
@testable import BigRational
import XCTest

class BigRationalAsDecimalStringTests: XCTestCase {
    func testSmallValue() {
        let locale = Locale(identifier: "en_IN") //
        let decimalSeparator = locale.decimalSeparator ?? "."
        let value = BigInt(1)
        let valueBigRational = BigRational(value) / BigRational(10).power(18)
        let moneyString = valueBigRational.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        XCTAssertEqual("0.000000000000000001", moneyString)
    }

    func testPrecision() {
        let locale = Locale(identifier: "en_US") //
        let decimalSeparator = locale.decimalSeparator ?? "."
        let value = BigRational(10.12345)

        var moneyString = value!.asDecimalString(precision: 3, decimalSeparator: decimalSeparator)
        XCTAssertEqual("10.123", moneyString)

        moneyString = value!.asDecimalString(precision: 5, decimalSeparator: decimalSeparator)
        XCTAssertEqual("10.12345", moneyString)

        moneyString = value!.asDecimalString(precision: 10, decimalSeparator: decimalSeparator)
        XCTAssertEqual("10.12345", moneyString)
    }
}
