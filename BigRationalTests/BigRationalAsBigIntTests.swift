@testable import BigRational
import XCTest
import BigInt

class BigRationalAsBigIntTests: XCTestCase {
    func testAsBigIntWithWholeNumber() {
        guard let x = BigRational("1223456") else { return XCTFail("missing values") }
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt("1223456"))
    }

    func testAsBigIntWithDecimalNumber() {
        let x = BigRational(numerator: BigInt(1223456), denominator: BigInt(12432))
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt(98))
    }

    func testAsBigIntWithNegativeNumeratorDecimalNumber() {
        let x = BigRational(numerator: BigInt(1223456), denominator: BigInt(-12432))
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt(-98))
    }

    func testAsBigIntWithNegativeDenominatorDecimalNumber() {
        let x = BigRational(numerator: BigInt(1223456), denominator: BigInt(-12432))
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt(-98))
    }

    func testAsBigIntWithNegativeDecimalNumbers() {
        let x = BigRational(numerator: BigInt(-1223456), denominator: BigInt(-12432))
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt(98))
    }

}
