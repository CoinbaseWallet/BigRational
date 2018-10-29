import XCTest
@testable import BigRational
import BigInt

class BigRationalAsDecimalStringTests: XCTestCase {

    func testSmallValue() {
        let locale = Locale(identifier: "en_IN") //
        let decimalSeparator = locale.decimalSeparator ?? "."
        let value = BigInt(1)
        let valueBigRational = BigRational(value) / BigRational(10).power(18)
        let moneyString = valueBigRational.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        XCTAssertEqual("0.000000000000000001", moneyString)
    }

}
