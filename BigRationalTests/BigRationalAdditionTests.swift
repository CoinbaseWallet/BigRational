@testable import BigRational
import XCTest

class BigRationalAdditionTests: XCTestCase {
    func testAdditionSmallNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational("1223456", decimalSeparator: decimalSeparator),
            let y = BigRational("837567", decimalSeparator: decimalSeparator)
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        XCTAssertEqual("2061023", resultString)
    }

    func testAdditionLargeNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational(
                "12248579348653478965347865347865892764780346578034657034234597637856384765783465",
                decimalSeparator: decimalSeparator
            ),
            let y = BigRational(
                "5647347865378657834657834678563475678346576",
                decimalSeparator: decimalSeparator
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "12248579348653478965347865347865892770427694443413314868892432316419860444130041"

        XCTAssertEqual(expected, resultString)
    }

    func testAdditionLargeDecimalNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational(
                "34978637946739647364379.47896534786534786589",
                decimalSeparator: decimalSeparator
            ),
            let y = BigRational(
                "786787769876789087897987564734786537.78563475678346576",
                decimalSeparator: decimalSeparator
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "786787769876824066535934304382150917.26460010464881362589"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testAdditionLargeNegativeDecimalNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational(
                "-243587349857934875893475834534.345348753489759834758347",
                decimalSeparator: decimalSeparator
            ),
            let y = BigRational(
                "786787769876789087897234783289473465763847653478657834657.3475634786578346578346",
                decimalSeparator: decimalSeparator
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "786787769876789087897234783045886115905912777585182000123.002214725168074823076253"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testAdditionSmallNegativeDecimalNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational(
                "-64040",
                decimalSeparator: decimalSeparator
            ),
            let y = BigRational(
                "84949",
                decimalSeparator: decimalSeparator
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "20909"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }
}
