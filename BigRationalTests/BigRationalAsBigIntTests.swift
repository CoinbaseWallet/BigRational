import BigInt
@testable import BigRational
import XCTest

class BigRationalAsBigIntTests: XCTestCase {
    func testAsBigIntWithWholeNumber() {
        guard let x = BigRational("1223456") else { return XCTFail("missing values") }
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt("1223456"))
    }

    func testAsBigIntWithDecimalNumber() {
        let x = BigRational(numerator: BigInt(1_223_456), denominator: BigInt(12432))
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt(98))
    }

    func testAsBigIntWithNegativeNumeratorDecimalNumber() {
        let x = BigRational(numerator: BigInt(1_223_456), denominator: BigInt(-12432))
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt(-98))
    }

    func testAsBigIntWithNegativeDenominatorDecimalNumber() {
        let x = BigRational(numerator: BigInt(1_223_456), denominator: BigInt(-12432))
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt(-98))
    }

    func testAsBigIntWithNegativeDecimalNumbers() {
        let x = BigRational(numerator: BigInt(-1_223_456), denominator: BigInt(-12432))
        let bigInt = x.asBigInt

        XCTAssertEqual(bigInt, BigInt(98))
    }

    func testAsBigIntwithDecimals() {
        guard let x = BigRational("12345.12345") else { return XCTFail("missing values") }
        let bigInt = x.asBigInt(shiftDecimalsByPlaces: 5)

        XCTAssertEqual(bigInt, BigInt(1_234_512_345))
    }

    func testAsBigIntwithManyDecimals() {
        guard let x = BigRational("0.123456789012345678") else { return XCTFail("missing values") }
        let bigInt = x.asBigInt(shiftDecimalsByPlaces: 18)

        XCTAssertEqual(bigInt, BigInt(123_456_789_012_345_678))
    }

    func testAsBigIntwithNoDecimals() {
        guard let x = BigRational("12345.12345") else { return XCTFail("missing values") }
        let bigInt = x.asBigInt(shiftDecimalsByPlaces: 0)

        XCTAssertEqual(bigInt, BigInt(12_345))
    }
}
